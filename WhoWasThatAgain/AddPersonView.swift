//
//  AddPersonView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 16/03/2023.
//

import SwiftUI

struct AddPersonView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Add person")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        //save
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
