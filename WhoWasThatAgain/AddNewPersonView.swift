//
//  AddNewPersonView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.dismiss) var dismiss
    var person: Person
    var onSave: (Person) -> Void
    
    @State var name: String
    @State var description: String
    @State var role: String
    @State var meetingPlace: String
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("name", text: $name)
                    TextField("description", text: $description)
                    TextField("role", text: $role)
                    TextField("meetingPlace", text: $meetingPlace)
                }
            }
            .navigationTitle("Person details")
            .toolbar {
                Button("Save") {
                    dismiss()
                }
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .foregroundColor(.black)
                }
            }
        }
    }
    
    init(person: Person, onSave: @escaping (Person) -> Void) {
        self.person = person
        self.onSave = onSave
        
        _name = State(initialValue: person.name)
        _description = State(initialValue: person.description)
        _role = State(initialValue: person.role)
        _meetingPlace = State(initialValue: person.meetingPlace)
    }
}

struct AddNewPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPersonView(person: Person.example) { _ in }
    }
}
