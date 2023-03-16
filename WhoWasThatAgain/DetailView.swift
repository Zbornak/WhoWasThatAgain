//
//  DetailView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct DetailView: View {
    //fetch Person entity from data model
    @FetchRequest(sortDescriptors: []) var people: FetchedResults<Person>
    
    //access managed object context to save data
    @Environment(\.managedObjectContext) var moc
    
    let person: Person
    
    var body: some View {
        NavigationView {
            VStack {
                Text(person.name ?? "Unknown person")
            }
            .navigationTitle(person.name ?? "Unknown person")
        }
    }
}
