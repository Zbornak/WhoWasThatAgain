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
    
    var person: Person
    
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
                        let newPerson = Person(id: UUID(), name: "", description: "", role: "", meetingPlace: "")
                        people.append(newPerson)
                        
                        showingAddNewPersonView.toggle()
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
                AddNewPersonView(person: person) { newPerson in
                    if let index = people.firstIndex(of: person) {
                        people[index] = newPerson
                    }
                }
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
        ContentView(person: Person.example)
    }
}
