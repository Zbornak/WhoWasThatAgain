//
//  ContentView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var people = [Person]()
    @State private var showingAddPerson = false
    
    var body: some View {
        NavigationView {
            VStack {
                if people.isEmpty {
                    
                } else {
                    List {
                        ForEach(people, id: \.id) { person in
                            NavigationLink {
                                DetailView()
                            } label: {
                                Text(person.name)
                                    .fontWeight(.bold)
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
            .navigationTitle("Who was that again?")
            .sheet(isPresented: $showingAddPerson) {
                AddPersonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
