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
    var meetingPlace: String
    
    static let example = Person(id: UUID(), name: "Bob Zerunckle", description: "One ear, calls everyone Jim", role: "Senior Developer, Vanderlay Industries", meetingPlace: "WWDC2018")
}
