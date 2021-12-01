//
//  Profile.swift
//  bigdata
//
//  Created by Александр Пономарёв on 12.11.2021.
//

import Foundation

// MARK: - Profile
struct Profile: Codable {
	let response: ProfileResponse?
}

// MARK: - Response
struct ProfileResponse: Codable {
	let players: [Player]?
}

// MARK: - Player
struct Player: Codable {
	let steamid: String?
	let communityvisibilitystate, profilestate: Int?
	let personaname: String?
	let commentpermission: Int?
	let profileurl: String?
	let avatar, avatarmedium, avatarfull: String?
	let avatarhash: String?
	let lastlogoff, personastate: Int?
	let primaryclanid: String?
	let timecreated, personastateflags: Int?
	let loccountrycode, locstatecode: String?
	let loccityid: Int?
}
