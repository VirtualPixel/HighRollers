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
    let values: [Int]
    let maxRoll: Int
    let total: Int
    
    init(values: [Int], maxRoll: Int) {
        self.values = values
        self.maxRoll = maxRoll
        
        total = values.reduce(0, +)
    }
}

@MainActor class Rolls: ObservableObject {
    @Published private(set) var rolls: [Roll]
    
    init() {        
        rolls = []
    }
    
    private func save() {
        
    }
    
    func add(_ roll: Roll) {
        rolls.append(roll)
    }
}
