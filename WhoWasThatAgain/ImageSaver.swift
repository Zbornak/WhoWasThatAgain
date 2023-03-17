//
//  ImageSaver.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 17/03/2023.
//

import UIKit

class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) -> UUID? {
        guard let jpegData = image.jpegData(compressionQuality: 0.8) else { return nil }
        let pictureId = UUID()
        let filename = FileManager.documentsDirectory.appendingPathComponent(pictureId.uuidString).appendingPathExtension("jpg")
        do {
            try jpegData.write(to: filename, options: [.atomic, .completeFileProtection])
            return pictureId
        } catch {
            return nil
        }
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        }
    }
}
