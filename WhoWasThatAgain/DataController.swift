//
//  DataController.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 16/03/2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "WhoWasThatAgain")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data falied to load: \(error.localizedDescription)")
            }
        }
    }
}
