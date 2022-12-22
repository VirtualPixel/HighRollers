//
//  HistoryView-ViewModel.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

extension HistoryView {
    @MainActor class ViewModel: ObservableObject {
        @Published var sort: SortType = .dateDescending
        @Published var showingConfirmation = false
        
        enum SortType {
            case sum, dateAscending, dateDescending, max
        }
    }
}
