//
//  HistoryView-ViewModel.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

extension HistoryView {
    class ViewModel: ObservableObject {
        @Published var sort: SortType = .dateDescending
        @Published var showingConfirmation = false
        
        enum SortType {
            case sum, dateAscending, dateDescending, max
        }
        
        func sortRolls(this: Roll, that: Roll) -> Bool {
            switch sort {
            case .dateDescending:
                return this.date > that.date
            case .dateAscending:
                return this.date < that.date
            case .max:
                return this.maxRoll > that.maxRoll
            case .sum:
                return this.total > that.total
            }
        }
    }
}
