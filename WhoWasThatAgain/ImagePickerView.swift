//
//  ImagePickerView.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 17/03/2023.
//

import SwiftUI

struct ImagePickerView: View {
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = false
    @Binding var pictureId: UUID?
    
    var body: some View {
        VStack {
            ZStack {
                image?
                    .resizable()
                    .scaledToFit()
                
                Button("Save image") {
                    guard let inputImage = inputImage else { return }
                    
                    let imageSaver = ImageSaver()
                    pictureId = imageSaver.writeToPhotoAlbum(image: inputImage)
                }
            }
            
            Button {
                showingImagePicker = true
            } label: {
                HStack {
                    Image(systemName: "person.fill.viewfinder")
                    Text("Add photo")
                }
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ImagePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ImagePickerView(pictureId: .constant(nil))
    }
}
