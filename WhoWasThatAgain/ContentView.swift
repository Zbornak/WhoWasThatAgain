//
//  ContentView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()
    @State private var selectedPerson: Person?
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(people, id: \.id) { person in
                        HStack {
                            Text(person.name)
                                .fontWeight(.bold)
                                .onTapGesture {
                                    selectedPerson = person
                                }
                            
                            Spacer()
                            
                            Button {
                                //show detail
                            } label: {
                                Image(systemName: "info.circle")
                                    .font(.headline)
                            }
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
            .sheet(item: $selectedPerson) { person in
                Text(person.name)
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
