//
//  DieGridView-ViewModel.swift
//  HighRollers
//
//  Created by Justin Wells on 12/31/22.
//

import SwiftUI

extension DieGridView {
    @MainActor class ViewModel: ObservableObject {
        let roll: Roll
        let adaptiveColumns = [
            GridItem(.adaptive(minimum: 80))
        ]
        
        var isNumeric: Bool {
            roll.maxRoll > 6
        }
        
        init(roll: Roll) {
            self.roll = roll
        }
    }
}
