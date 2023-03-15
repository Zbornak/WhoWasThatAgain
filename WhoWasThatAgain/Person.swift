//
//  Person.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import Foundation

struct Person: Identifiable, Codable, Equatable {
    let id: UUID
    var name: String
    var description: String
    var role: String
    
    static let example = Person(id: UUID(), name: "Antonio Strijdom", description: "My brother", role: "Senior Developer")
}
