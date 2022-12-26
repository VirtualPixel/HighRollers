//
//  FileManager-Documents.swift
//  HighRollers
//
//  Created by Justin Wells on 12/26/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
