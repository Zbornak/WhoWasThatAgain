//
//  DetailView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import SwiftUI

struct DetailView: View {
    //fetch Person entity from data model
    @FetchRequest(sortDescriptors: []) var people: FetchedResults<Person>
    
    //access managed object context to save data
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Text("hello")
        //Text(person.name ?? "Unknown person")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
