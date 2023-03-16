//
//  ContentView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    //fetch Person entity from data model
    @FetchRequest(sortDescriptors: []) var people: FetchedResults<Person>
    
    //access managed object context to save data
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAddPerson = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(people) { person in
                        NavigationLink {
                            DetailView(person: person)
                        } label: {
                            VStack(alignment: .leading) {
                                Text("\(person.firstName ?? "Unknown first name") \(person.surname ?? "Unknown surname")")
                                    .fontWeight(.bold)
                                Text(person.meetingPlace ?? "Unknown meeting place")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button {
                        showingAddPerson.toggle()
                    } label: {
                        Image(systemName: "person.fill.badge.plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            .navigationTitle("🤔Who was that again?")
            .sheet(isPresented: $showingAddPerson) {
                AddPersonView()
            }
            .toolbar {
                Button("Edit") {
                    //edit
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
