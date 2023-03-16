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
                                .fontWeight(.bold)
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    
                    Button {
                        //
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
