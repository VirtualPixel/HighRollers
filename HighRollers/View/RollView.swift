//
//  RollView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

struct RollView: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Number of Dice")
                        .font(.title2.bold())
                    Spacer()
                }
                .padding()
                
                DiceStepper(count: $viewModel.rolls, range: viewModel.maxDie)
                
                HStack {
                    Text("How many Dice sides")
                        .font(.title2.bold())
                    Spacer()
                }
                .padding()
                
                Picker("Pick the number of sides on each die", selection: $viewModel.selectedDieSides) {
                    ForEach(viewModel.sides, id: \.self) { side in
                                Text("\(side) sided")
                    }
                }
                .frame(width: 300, height: 60)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .shadow(radius: 4)
                )
                .foregroundColor(.black)
                
                
                Spacer()
                
                Button {
                    viewModel.roll()
                } label: {
                    Text("Roll")
                        .frame(width: 100, height: 50)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .minimumScaleFactor(0.01)
                }
                .padding(.vertical)
            }
            .navigationTitle("Roll the Dice")
        }
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
