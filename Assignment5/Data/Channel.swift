//
//  Channel.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import Foundation

struct Channel: Identifiable, Decodable {
	let id: UUID
	let name: String
	let messages: [Message]?
}
