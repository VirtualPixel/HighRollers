//
//  DieRolledView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/22/22.
//

import Foundation

extension DieRolledView {
    @MainActor class ViewModel: ObservableObject {
        var roll: Roll
        
        init(roll: Roll) {
            self.roll = roll
        }
    }
}
