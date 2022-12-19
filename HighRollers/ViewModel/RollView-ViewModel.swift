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
        @Published var maxDie = 1...20
        @Published var rolls = 1
        @Published var selectedDieSides = 6
        //@Published var rollValues: [Roll] = []
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
        
        func roll() {
            prepareHaptics()
            
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            
            randomize()
        }
        
        func randomize() {
            var rollValues: [Int] = []
            range = 1...selectedDieSides
            
            for _ in 1...rolls {
                let value = Int.random(in: range)
                rollValues.append(value)
            }
            
            let newRoll = Roll(values: rollValues)
        }
        
        init(rolls: Int = 1, selectedDieSides: Int = 6) {
            self.rolls = rolls
            self.selectedDieSides = selectedDieSides
        }
    }
}
