//
//  FriendList.swift
//  bigdata
//
//  Created by Александр Пономарёв on 12.11.2021.
//

import Foundation

struct FriendAPI: Codable {
	let friendslist: Friendslist?
}

// MARK: - Friendslist
struct Friendslist: Codable {
	let friends: [Friend]?
}

// MARK: - Friend
struct Friend: Codable {
	let steamid: String?
	let relationship: Relationship?
	let friendSince: Int?

	enum CodingKeys: String, CodingKey {
		case steamid, relationship
		case friendSince
	}
}



enum Relationship: String, Codable {
	case friend = "friend"
}
