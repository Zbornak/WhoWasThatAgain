//
//  Person.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import Foundation

struct Person: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let role: String
    let photo: String
}
