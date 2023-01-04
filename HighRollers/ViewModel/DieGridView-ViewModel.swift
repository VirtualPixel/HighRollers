//
//  DieGridView-ViewModel.swift
//  HighRollers
//
//  Created by Justin Wells on 12/31/22.
//

import SwiftUI

extension DieGridView {
    class ViewModel: ObservableObject {
        @Published var roll: Roll
        let dieCount: Int
        
        let adaptiveColumns = [
            GridItem(.adaptive(minimum: 80))
        ]
        
        var isNumeric: Bool {
            roll.maxRoll > 6
        }
        
        init(roll: Roll, dieCount: Int) {
            self.roll = roll
            self.dieCount = dieCount
        }
    }
}
