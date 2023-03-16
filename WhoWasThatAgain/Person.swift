//
//  Person.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import Foundation

struct Person: Identifiable, Codable, Equatable {
    var id: UUID
    var name: String
    var information: String
    var role: String
    var meetingPlace: String
    
    static let example = Person(id: UUID(), name: "Bob Zerunckle", information: "One ear, calls everyone Jim", role: "Senior Developer, Vanderlay Industries", meetingPlace: "WWDC2018")
    
    static func ==(lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id
    }
}
