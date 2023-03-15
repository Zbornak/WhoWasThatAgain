//
//  FileManager-DocumentsDirectory.swift
//  WhoWasThatAgain
//
//  Created by Mark Strijdom on 15/03/2023.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
