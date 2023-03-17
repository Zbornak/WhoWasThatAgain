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
            image?
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 200)
            
            HStack {
                Button {
                    showingImagePicker = true
                } label: {
                    HStack {
                        Image(systemName: "person.fill.viewfinder")
                        Text("Add photo")
                    }
                }
                .padding(.horizontal)
                
                Button {
                    guard let inputImage = inputImage else { return }
                    
                    let imageSaver = ImageSaver()
                    pictureId = imageSaver.writeToPhotoAlbum(image: inputImage)
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("Save image")
                    }
                }
                .padding(.horizontal)
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
