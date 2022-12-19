//
//  Roll.swift
//  HighRollers
//
//  Created by Justin Wells on 12/18/22.
//

import Foundation

struct Roll: Identifiable, Codable {
    var id = UUID()
    var date = Date.now
    let value: Int
}

class Rolls: ObservableObject {
    //@Published var rolls
}
