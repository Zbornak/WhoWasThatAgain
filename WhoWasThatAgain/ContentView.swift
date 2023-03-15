//
//  ContentView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(people, id: \.id) { person in
                        NavigationLink {
                            DetailView()
                        } label: {
                            Text(person.name)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        let newPerson = Person(id: UUID(), name: "Bob Zerunckle", description: "One ear, calls everyone Jim", role: "Senior Developer, Vanderlay Industries", meetingPlace: "WWDC2018")
                        people.append(newPerson)
                    } label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.green)
                    .foregroundColor(.black)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
            .navigationTitle("Who was that again?")
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
