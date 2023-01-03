//
//  RollView-ViewModel.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import CoreHaptics
import SwiftUI

extension RollView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var range = 1...6
        @Published var maxDie = 1...200
        @Published var dieCount = 1
        @Published var selectedDieSides = 6
        @Published var rolledValues: [Int] = []
        @Published private var engine: CHHapticEngine?
        
        var showDots: Bool {
            selectedDieSides < 6
        }
        
        let sides = [2, 4, 6, 8, 10, 12, 20, 100]
        
        func prepareHaptics() {
            guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

                do {
                    engine = try CHHapticEngine()
                    try engine?.start()
                } catch {
                    print("There was an error creating the engine: \(error.localizedDescription)")
                }
        }
        
        func roll() -> Roll {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            return randomize()
        }
        
        func randomize() -> Roll {
            var rollValues: [Int] = []
            range = 1...selectedDieSides
            
            for _ in 1...dieCount {
                let value = Int.random(in: range)
                rollValues.append(value)
            }
            
            rolledValues = rollValues
            
            return Roll(values: rollValues, maxRoll: selectedDieSides)
        }
        
        init(dieCount: Int = 1, selectedDieSides: Int = 6) {
            self.dieCount = dieCount
            self.selectedDieSides = selectedDieSides
        }//
    }
}
