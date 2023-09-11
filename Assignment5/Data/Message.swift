//
//  Message.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import Foundation

struct Message: Identifiable, Decodable {
	let id: UUID
	let content: String
	var posted: Date
	let member: Member
}
