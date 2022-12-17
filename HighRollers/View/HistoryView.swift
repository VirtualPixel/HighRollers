//
//  HistoryView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

struct HistoryView: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Text("History")
                .navigationTitle("Roll History")
        }
    }
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
