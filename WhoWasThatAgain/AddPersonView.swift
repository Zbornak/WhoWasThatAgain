//
//  AddPersonView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 16/03/2023.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    
    //access managed object context to save data
    @Environment(\.managedObjectContext) var moc
    
    @State private var firstName = ""
    @State private var information = ""
    @State private var meetingPlace = ""
    @State private var role = ""
    @State private var surname = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $firstName)
                    TextField("Surname", text: $surname)
                    TextField("Information", text: $information)
                    TextField("Role", text: $role)
                    TextField("Meeting place", text: $meetingPlace)
                } header: {
                    Text("basic details")
                }
                
                Section {
                    Text("+ Add photo")
                } header: {
                    Text("Add a photograph")
                }
            }
            .navigationTitle("Add person")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        let newPerson = Person(context: moc)
                        
                        newPerson.firstName = firstName
                        newPerson.id = UUID()
                        newPerson.information = information
                        newPerson.meetingPlace = meetingPlace
                        newPerson.role = role
                        newPerson.surname = surname
                        
                        if moc.hasChanges {
                            try? moc.save()
                        }
                        
                        dismiss()
                    } label: {
                        Text("Save")
                    }
                    
                    Spacer()
                    
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
