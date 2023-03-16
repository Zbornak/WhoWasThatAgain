//
//  AddPersonView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 16/03/2023.
//

import SwiftUI

struct AddPersonView: View {
    var body: some View {
        NavigationView {
            Form {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
            .navigationTitle("Add person")
        }
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
