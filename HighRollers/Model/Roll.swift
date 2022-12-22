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
    
    static let example = Roll(values: [15, 30, 5, 10, 20, 75, 54, 58, 82, 59, 24, 1], maxRoll: 100)
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
