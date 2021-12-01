//
//  ElasticProfile.swift
//  bigdata
//
//  Created by Александр Пономарёв on 12.11.2021.
//

import RealmSwift
import Foundation


struct ElasticProfile: Codable {
	var id: String
	var name: String?
	var createdDate: Int?
	var gamesCount: Int?
	var playtime: Int?
	var friendsCount: Int
	var country: String?
	var state: String?
	var city: Int?
	var favoriteGame: String?
}

class RealmModel: Object {
	@objc dynamic var id: String = ""
	@objc dynamic var name: String = ""
	@objc dynamic var createdDate: Int = 0
	@objc dynamic var gamesCount: Int = 0
	@objc dynamic var playtime: Int = 0
	@objc dynamic var friendsCount: Int = 0
	@objc dynamic var country: String = "NOT"
	@objc dynamic var state: String = "NOT"
	@objc dynamic var city: Int = -1
	@objc dynamic var favoriteGame: String = "NOT"
	
	convenience init(
		id: String,
		name: String,
		createdDate: Int,
		gamesCount: Int,
		playtime: Int,
		friendsCount: Int,
		country: String,
		state: String,
		city: Int,
		favoriteGame: String
	) {
		self.init()
		self.id = id
		self.name = name
		self.createdDate = createdDate
		self.gamesCount = gamesCount
		self.playtime = playtime
		self.friendsCount = friendsCount
		self.country = country
		self.state = state
		self.city = city
		self.favoriteGame = favoriteGame
	}
}
