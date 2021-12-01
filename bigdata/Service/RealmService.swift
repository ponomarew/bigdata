//
//  RealmService.swift
//  bigdata
//
//  Created by Александр Пономарёв on 13.11.2021.
//

import RealmSwift

final class RealmService {
	private var realm: Realm {
		let conf = Realm.Configuration(schemaVersion: 3)
		guard let realm = try? Realm(configuration: conf) else {
			fatalError("Realm can't be initialized")
		}
		return realm
	}

	func getAll() -> Results<RealmModel> {
		let realmPerson = realm.objects(RealmModel.self)
		return realmPerson
	}

	func addAll(people: [ElasticProfile]) {
		do {
			try realm.write {
				for people in people {
					let realmPerson = RealmModel(
						id: people.id,
						name: people.name ?? "",
						createdDate: people.createdDate ?? 0,
						gamesCount: people.gamesCount ?? 0,
						playtime: people.playtime ?? 0,
						friendsCount: people.friendsCount,
						country: people.country ?? "NOT",
						state: people.state ?? "NOT",
						city: people.city ?? 0,
						favoriteGame: people.favoriteGame ?? "NOT"
					)
					realm.add(realmPerson)
				}
			}
		} catch {
			print("realm error", error.localizedDescription)
		}
	}
	
	func update(people: [ElasticProfile]) {
		do {
			try realm.write {
				var counter = 0
				for person in people {
					counter += 1
					let updatedPerson = realm.objects(RealmModel.self).filter("id == '\(person.id)'").first
					updatedPerson?.name = person.name ?? "noname"
					updatedPerson?.createdDate = person.createdDate ?? 0
					updatedPerson?.gamesCount = person.gamesCount ?? 0
					updatedPerson?.playtime = person.playtime ?? 0
					updatedPerson?.city = person.city ?? 0
					updatedPerson?.country = person.country ?? "NOT"
					updatedPerson?.state = person.state ?? "NOT"
					updatedPerson?.favoriteGame = person.favoriteGame ?? "NOT"
					if counter == people.count {
						print("saved")
					}
				}
			}
		} catch {
			print("realm error", error.localizedDescription)
		}
	}
}

