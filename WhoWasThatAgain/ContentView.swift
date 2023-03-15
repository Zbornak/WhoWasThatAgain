//
//  ContentView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()
    @State private var showingAddNewPersonView = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(people, id: \.id) { person in
                        NavigationLink {
                            //DetailView
                        } label: {
                            Text(person.name)
                                .fontWeight(.bold)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        let newPerson = Person(id: UUID(), name: "New person", description: "", role: "", meetingPlace: "")
                        people.append(newPerson)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            .navigationTitle("Who was that again?")
            .sheet(isPresented: $showingAddNewPersonView) {
                AddNewPersonView(person: Person.example)
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
