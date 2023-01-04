//
//  DieGridView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/31/22.
//

import SwiftUI

struct DieGridView: View {
    @Binding private var dieCount: Int
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: viewModel.adaptiveColumns, spacing: 20) {
                ForEach(0..<dieCount, id: \.self) { index in
                    let number = viewModel.roll.values.isEmpty ? viewModel.roll.maxRoll : viewModel.roll.values[index]
                    Die(result: number, isNumeric: viewModel.isNumeric)
                        .frame(width: 80, height: 80)
                }
            }
            .padding(.vertical)
        }
    }
    
    init(roll: Roll, dieCount: Binding<Int>) {
        _dieCount = dieCount
        _viewModel = StateObject(wrappedValue: ViewModel(roll: roll, dieCount: dieCount.wrappedValue))
    }
}

struct DieGridView_Previews: PreviewProvider {
    @State static var dieCount = Roll.example.values.count
    
    static var previews: some View {
        let roll = Roll.example
        return DieGridView(roll: roll, dieCount: $dieCount)
    }
}
