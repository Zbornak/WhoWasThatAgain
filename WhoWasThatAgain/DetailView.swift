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
    
    @Environment(\.dismiss) var dismiss
    
    @State private var showingDeleteAlert = false
    
    let person: Person
    
    var body: some View {
        ScrollView {
            VStack {
                Image(uiImage: getImage())
                    .resizable()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                Text("\(person.firstName ?? "Unknown first name") \(person.surname ?? "Unknown surname")")
                    .font(.title)
                    .fontWeight(.bold)
                Text(person.role ?? "Unknown role")
                    .foregroundColor(.secondary)
                Text("You met \(person.firstName ?? "Unknown first name") at \(person.meetingPlace ?? "Unknown meeting place") on \(person.meetingDate?.formatted(date: .long, time: .omitted) ?? "Unknown date").")
                    .padding()
            }
            .alert("Delete person?", isPresented: $showingDeleteAlert) {
                Button("Delete", role: .destructive, action: deletePerson)
                
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure?")
            }
            .toolbar {
                Button {
                    showingDeleteAlert = true
                } label: {
                    Label("Delete this person", systemImage: "person.fill.xmark")
                }
            }
        }
    }
    
    func deletePerson() {
        moc.delete(person)
        
        if moc.hasChanges {
            try? moc.save()
        }
        dismiss()
    }
    
    func getImage() -> UIImage {
        let pictureUrl = FileManager.documentsDirectory.appendingPathComponent(person.pictureid?.uuidString ?? "Unknown").appendingPathExtension("jpg")
        if
            let data = try? Data(contentsOf: pictureUrl),
            let image = UIImage(data: data) {
            return image
        }
        return UIImage()
    }
}
