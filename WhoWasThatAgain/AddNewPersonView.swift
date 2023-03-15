//
//  AddNewPersonView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct AddNewPersonView: View {
    @Environment(\.dismiss) var dismiss
    
    //@State private var name: String
    //@State private var description: String
    //@State private var role: String
    
    var body: some View {
        NavigationView {
            Form {
                Text("Hello")
            }
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "multiply")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct AddNewPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPersonView()
    }
}
