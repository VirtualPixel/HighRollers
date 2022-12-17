//
//  RollView-ViewModel.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import Foundation

extension RollView {
    @MainActor class ViewModel: ObservableObject {
        @Published var value = Int.random(in: 1...10)
        
        func randomize() {
            let oldValue = value
            
            while oldValue == value {
                value = Int.random(in: 1...10)
            }
        }

    }
}
