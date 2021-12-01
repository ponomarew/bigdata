//
//  ApiService.swift
//  bigdata
//
//  Created by Александр Пономарёв on 12.11.2021.
//

import SwiftyJSON
import Alamofire
import Foundation


class ApiService {
	var baseId = "76561198152057387"
	var key = "3C54EB8F75313DA6C1447FBC445BB338"
	var proceedIds: Set<String> = []
	var queueIds: Set<String> = ["76561198152057387"]
	var baseURL = "http://api.steampowered.com/"
	private let realmService = RealmService()
	private lazy var realmPerson = realmService.getAll()
	
	
	enum RequestType: String {
		case iSteamUser = "ISteamUser/"
		case iPlayerService = "IPlayerService/"
	}
	
	enum RequestSubtype: String {
		case getFriend = "GetFriendList/"
		case getPlayerSummaries = "GetPlayerSummaries/"
		case getOwnedGames = "GetOwnedGames/"
	}
	
	func getIds(completion: @escaping (Int) -> ()) {
		let url = "\(baseURL)\(RequestType.iSteamUser.rawValue)\(RequestSubtype.getFriend.rawValue)v0001/?key=\(key)&steamid=\(baseId)&relationship=friend"
		AF.request(url)
			.validate()
			.responseDecodable(of: FriendAPI.self) { response in
				if response.error != nil {
					print("error ids", response.error?.localizedDescription ?? "")
				}
				guard let friends = response.value else { return }
				friends.friendslist?.friends?.forEach({ fri in
					self.queueIds.insert(fri.steamid ?? "")
				})
				completion(friends.friendslist?.friends?.count ?? 0)
			}
	}
	
	func grindIds(id: String, com: @escaping (ElasticProfile) -> ()) {
		if !proceedIds.contains(id) {
			let url = "\(baseURL)\(RequestType.iSteamUser.rawValue)\(RequestSubtype.getFriend.rawValue)v0001/?key=\(key)&steamid=\(id)&relationship=friend"
			AF.request(url)
				.validate()
				.responseDecodable(of: FriendAPI.self) { response in
					if response.error != nil {
						self.proceedIds.insert(id)
						print("error", response.error?.localizedDescription ?? "")
						com(ElasticProfile(id: id, friendsCount: 0))
					}
					guard let friends = response.value else { return }
					friends.friendslist?.friends?.forEach({ fri in
						self.queueIds.insert(fri.steamid ?? "")
					})
					self.proceedIds.insert(id)
					com(ElasticProfile(id: id, friendsCount: friends.friendslist?.friends?.count ?? 0))
				}
		}
	}
	
	func getGamesCount(id: String, completion: @escaping (Int, Int, String) -> ()) {
		let url = "\(baseURL)\(RequestType.iPlayerService.rawValue)\(RequestSubtype.getOwnedGames.rawValue)v0001/?key=\(key)&include_played_free_games=1&include_appinfo=1&steamid=\(id)&format=json"
		AF.request(url) { $0.timeoutInterval = 30000 }
			.validate()
			.responseDecodable(of: GameOwned.self) { response in
				if response.error != nil {
					print("error games count", response.error?.localizedDescription ?? "")
				}
				guard let games = response.value else { return }
				
				var playtime = 0
				var cycleCounter = 1
				games.response?.games?.forEach({ game in
					playtime += game.playtime_forever ?? 0
					cycleCounter += 1
				})
				let favoriteGame = games.response?.games?.max(by: { game1, game2 in
					return game1.playtime_forever ?? -1 < game2.playtime_forever ?? -1
				})
				completion(games.response?.games?.count ?? -1, playtime / 60, favoriteGame?.name ?? "NOT")
			}
	}
	
	func getProfileData(id: String, completion: @escaping (String, Int, String, Int, String) -> ()) {
		let url = "\(baseURL)\(RequestType.iSteamUser.rawValue)\(RequestSubtype.getPlayerSummaries.rawValue)v0002/?key=\(key)&steamids=\(id)"
		AF.request(url)
			.validate()
			.responseDecodable(of: Profile.self) { response in
				if response.error != nil {
					print("error profile", response.error?.localizedDescription ?? "")
				}
				guard let profile = response.value else { return }
				let shortProfle = profile.response?.players?.first
				completion(
					shortProfle?.personaname ?? "NULL",
					shortProfle?.timecreated ?? 0,
					shortProfle?.loccountrycode ?? "NULL",
					shortProfle?.loccityid ?? -1,
					shortProfle?.locstatecode ?? "NULL"
				)
			}
	}
	
	func getProfilesData(id: String, completion: @escaping ([Player]) -> ()) {
		let url = "\(baseURL)\(RequestType.iSteamUser.rawValue)\(RequestSubtype.getPlayerSummaries.rawValue)v0002/?key=\(key)&steamids=\(id)"
		AF.request(url)
			.validate()
			.responseDecodable(of: Profile.self) { response in
				if response.error != nil {
					print("error profile", response.error?.localizedDescription ?? "")
				}
				guard let profile = response.value else { return }
				guard let shortProfle = profile.response?.players else { return }
				print("dones", shortProfle.count)
				completion(shortProfle)
			}
	}
	
	func createProfiles() {
		getIds { friendsCount in
			self.queueIds.forEach { id in
				self.getProfileData(id: id) { name, date, country, city, state  in
					self.getGamesCount(id: id) { gamesCount, playtime, _  in
						let elasticProfile = ElasticProfile(id: id, name: name, createdDate: date, gamesCount: gamesCount, playtime: playtime, friendsCount: friendsCount, country: country, state: state, city: city)
						elasticProfiles.append(elasticProfile)
						if elasticProfiles.count == self.queueIds.count {
							self.realmService.addAll(people: elasticProfiles)
							self.postToElastic(profiles: elasticProfiles)
						}
					}
				}

			}
		}
	}
	
	func postToElastic(profiles: [ElasticProfile]) {
		let realmMod = realmService.getAll().dropFirst(67000)
		realmMod.forEach { [weak self] profile in
			guard let self = self else { return }
			let concurrentQueue = DispatchQueue(label: "\(profile.id)", attributes: .concurrent)
			concurrentQueue.sync {
				let parameters: [String: Any] = [
					"date" : self.getDate(int: profile.createdDate),
					"gamesCount" : profile.gamesCount,
					"name": profile.name,
					"playtime": profile.playtime,
					"friendsCount": profile.friendsCount + Int.random(in: 0...50),
					"country": self.countryName(countryCode: profile.country) ?? "null",
					"city": self.getCityName(country: profile.country, stateCode: profile.state, cityCode: String(profile.city)),
					"favoriteGame": profile.favoriteGame
				]
				let url = "http://localhost:9200/bigdatatest/_doc/\(profile.id)"
					AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
						.validate()
						.response { response in
							if response.error != nil {
								print("error post", response.error?.localizedDescription ?? "")
							}
						}
			}
		}
	}
	
	func getDate(int: Int) -> String {
		let date = Date(timeIntervalSince1970: TimeInterval(int))
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd"
		let stringDate = "\(formatter.string(from: date))"
		return stringDate
	}
	
	func countryName(countryCode: String) -> String? {
		let current = Locale(identifier: "en_US")
		return current.localizedString(forRegionCode: countryCode)
	}
	
	func getCityName(country: String, stateCode: String, cityCode: String) -> String {
		if country == "NOT" { return "NULL" }
		if cityCode == "NOT" { return "NULL" }
		var city = "NULL"
		if let path = Bundle.main.path(forResource: "steam_countries", ofType: "json") {
			do {
				let fileURL = URL(fileURLWithPath: path)
				let jsonData = try Data(contentsOf: fileURL)
				
				let json = try JSON(data: jsonData)
				city = json[country.uppercased()]["states"][stateCode.uppercased()]["cities"][cityCode.uppercased()]["name"].string ?? "NULL"
			} catch {
				print(error.localizedDescription)
			}
		}
		return city
	}
}
