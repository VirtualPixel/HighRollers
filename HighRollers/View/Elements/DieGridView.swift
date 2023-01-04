//
//  DieGridView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/31/22.
//

import SwiftUI

struct DieGridView: View {
    @Binding private var dieCount: Int
    @Binding private var maxRoll: Int
    @ObservedObject private var viewModel: ViewModel
    
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
    
    init(roll: Roll, dieCount: Binding<Int>, maxRoll: Binding<Int>) {
            _dieCount = dieCount
            _maxRoll = maxRoll
            _viewModel = ObservedObject(wrappedValue: ViewModel(roll: roll, dieCount: dieCount.wrappedValue))
        }
}

struct DieGridView_Previews: PreviewProvider {
    @State static var dieCount = Roll.example.values.count
    @State static var maxRoll = Roll.example.maxRoll
    
    static var previews: some View {
        let roll = Roll.example
        return DieGridView(roll: roll, dieCount: $dieCount, maxRoll: $maxRoll)
    }
}
