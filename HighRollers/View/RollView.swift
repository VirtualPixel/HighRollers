//
//  RollView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

struct RollView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var rolls: Rolls
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                ScrollView {
                    VStack {
                        HStack {
                            Text("Number of Dice")
                                .font(.title2.bold())
                            Spacer()
                        }
                        .padding()
                        
                        DiceStepper(count: $viewModel.dieCount, range: viewModel.maxDie)
                        
                        HStack {
                            Text("How many Dice sides")
                                .font(.title2.bold())
                            Spacer()
                        }
                        .padding()
                        
                        Picker(selection: $viewModel.selectedDieSides, label: Text("Pick the number of sides on each die")) {
                            ForEach(viewModel.sides, id: \.self) { side in
                                Text("\(side) sided")
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        .frame(width: 300, height: 150)
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(colorScheme == .dark ? .black : .white))
                        .shadow(color: colorScheme == .dark ? .white : .gray, radius: 4)
                        .onChange(of: viewModel.selectedDieSides) { _ in
                            viewModel.reset()
                        }
                        .pickerStyle(.wheel)
                        
                        
                        DieGridView(roll: Roll(values: viewModel.rolledValues, maxRoll: viewModel.selectedDieSides), dieCount: $viewModel.dieCount, maxRoll: $viewModel.selectedDieSides)
                            .padding()
                        
                        Spacer()
                    }
                }
                .navigationTitle("Roll the Dice")
            }
            Button {
                roll()
            } label: {
                Text("Roll")
                    .frame(width: 100, height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .minimumScaleFactor(0.01)
                    .shadow(color: .white, radius: 10)
            }
            .padding(.vertical)
            .position(x: geometry.size.width / 2, y: geometry.size.height - 50)
        }
    }
    
    func roll() {
        rolls.add(viewModel.roll())
    }
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
}

struct RollView_Previews: PreviewProvider {
    static var previews: some View {
        RollView()
    }
}
