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
    @State private var meetingDate = Date.now
    @State private var pictureId: UUID?
    
    let context = CIContext()
    
    var body: some View {
        NavigationView {
            ScrollView {
                TextField("First name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Surname", text: $surname)
                    .textFieldStyle(.roundedBorder)
                TextField("Information", text: $information)
                    .textFieldStyle(.roundedBorder)
                TextField("Role", text: $role)
                    .textFieldStyle(.roundedBorder)
                TextField("Meeting place", text: $meetingPlace)
                    .textFieldStyle(.roundedBorder)
                
                VStack {
                    DatePicker(selection: $meetingDate, in: ...Date.now, displayedComponents: .date) {
                        Text("When did you meet?")
                    }
                   
                ImagePickerView(pictureId: $pictureId)
                        .padding()
                }
                .navigationTitle("Add person")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button(role: .cancel) {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        
                        Spacer()
                        
                        Button {
                            let newPerson = Person(context: moc)
                            
                            newPerson.firstName = firstName
                            newPerson.id = UUID()
                            newPerson.information = information
                            newPerson.meetingPlace = meetingPlace
                            newPerson.role = role
                            newPerson.surname = surname
                            newPerson.meetingDate = meetingDate
                            newPerson.pictureid = pictureId
                            
                            if moc.hasChanges {
                                try? moc.save()
                            }
                            
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
