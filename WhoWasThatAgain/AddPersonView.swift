//
//  AddPersonView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 16/03/2023.
//

import CoreImage
import CoreImage.CIFilterBuiltins
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
    
    //newstuff begin
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilterSheet = false
    @State private var processedImage: UIImage?
    
    let context = CIContext()
    //newstuff end
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $firstName)
                    TextField("Surname", text: $surname)
                    TextField("Information", text: $information)
                    TextField("Role", text: $role)
                    TextField("Meeting place", text: $meetingPlace)
                    VStack {
                        DatePicker(selection: $meetingDate, in: ...Date.now, displayedComponents: .date) {
                            Text("When did you meet?")
                        }
                    }
                } header: {
                    Text("basic details")
                }
                
                Section {
                    Button {
                        //select picture from library
                    } label: {
                        HStack {
                            Image(systemName: "person.fill.viewfinder")
                            Text("Add photo")
                        }
                    }
                } header: {
                    Text("Add a photograph")
                }
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
    }
    
    //newstuff begin
    func loadImage() {
        guard let inputImage = inputImage else {
            return
        }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func save() {
        guard let processedImage = processedImage else { return }
        
        let imageSaver = ImageSaver()
        
        imageSaver.successHandler = {
            print("Success")
        }
        
        imageSaver.errorHandler = {
            print("Failure: \($0.localizedDescription)")
        }
        
        imageSaver.writeToPhotoAlbum(image: processedImage)
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
    //newstuff end
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
