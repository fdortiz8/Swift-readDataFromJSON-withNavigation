//
//  Workspace.swift
//  Assignment5
//
//  Created by Fernando Ortiz on 7/12/23.
//

import Foundation

struct Workspace: Identifiable, Decodable {
	let id: UUID
	let name: String
	let channels: [Channel]?
}
