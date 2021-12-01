//
//  GameOwned.swift
//  bigdata
//
//  Created by Александр Пономарёв on 12.11.2021.
//
import Foundation

// MARK: - GameOwned
struct GameOwned: Codable {
	let response: GameResponse?
}

// MARK: - Response
struct GameResponse: Codable {
	let game_count: Int?
	let games: [Game]?
}

// MARK: - Game
struct Game: Codable {
	let appid, playtime_forever: Int?
	let name: String?
}
