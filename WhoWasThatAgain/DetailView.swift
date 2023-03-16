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
                Image("example")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                Text(person.name ?? "Unknown person")
                    .font(.title)
                    .fontWeight(.bold)
                Text(person.role ?? "Unknown role")
                    .foregroundColor(.secondary)
            }
        }
    }
}
