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
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SaveData")
    @Published private(set) var rolls: [Roll]
    
    init() {        
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode([Roll].self, from: data) {
                rolls = decoded
                return
            }
        }
        
        rolls = []
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(rolls) {
            try? data.write(to: savePath, options: [.atomic, .completeFileProtection])
        }
    }
    
    func add(_ roll: Roll) {
        objectWillChange.send()
        rolls.append(roll)
        save()
    }
    
    func sort(newOrder: [Roll]) {
        rolls = newOrder
    }
    
    func remove(at offsets: IndexSet) {
        objectWillChange.send()
        rolls.remove(atOffsets: offsets)
        save()
    }
}
