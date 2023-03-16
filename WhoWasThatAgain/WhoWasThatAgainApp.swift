//
//  WhoWasThatAgainApp.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

@main
struct WhoWasThatAgainApp: App {
    //create instance of data model
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //inject data model into environment
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
