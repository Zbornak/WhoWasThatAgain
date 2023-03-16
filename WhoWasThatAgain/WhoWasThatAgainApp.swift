//
//  WhoWasThatAgainApp.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

@main
struct WhoWasThatAgainApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(person: Person.example)
        }
    }
}
