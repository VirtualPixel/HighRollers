//
//  DieGridView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/31/22.
//

import SwiftUI

struct DieGridView: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.adaptiveColumns, spacing: 20) {
                if viewModel.roll.values.isEmpty {
                    ForEach(0..<viewModel.dieCount) { _ in 
                        Die(result: viewModel.roll.maxRoll, isNumeric: viewModel.isNumeric)
                            .frame(width: 80, height: 80)
                    }
                } else {
                    ForEach(viewModel.roll.values, id: \.self) { number in
                        Die(result: number, isNumeric: viewModel.isNumeric)
                            .frame(width: 80, height: 80)
                    }
                }
            }
            .padding(.vertical)
        }
    }
    
    init(roll: Roll, dieCount: Int) {
        _viewModel = StateObject(wrappedValue: ViewModel(roll: roll, dieCount: dieCount))
    }
}

struct DieGridView_Previews: PreviewProvider {
    static var previews: some View {
        DieGridView(roll: Roll.example, dieCount: Roll.example.values.count)
    }
}
