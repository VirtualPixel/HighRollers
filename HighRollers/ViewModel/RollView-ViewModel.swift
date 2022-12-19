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
        @Published var range: ClosedRange<Int>
        @Published var maxDie = 1...20
        @Published var rolls = 1
        @Published var selectedDieSides = 6
        @State private var engine: CHHapticEngine?
        
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
            
            print("Rolls: \(rolls) and Die sides: \(selectedDieSides)")
        }
        
        init(rolls: Int = 1, selectedDieSides: Int = 6) {
            self.rolls = rolls
            self.selectedDieSides = selectedDieSides
            
            self.range = 1...selectedDieSides
        }
    }
}
