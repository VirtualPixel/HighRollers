//
//  HistoryView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var rolls: Rolls
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(rolls.rolls.sorted(by: viewModel.sortRolls)) { roll in
                    HStack {
                        Die(result: roll.maxRoll)
                            .frame(width: 70, height: 70)
                            .padding(.horizontal, 5)
                        
                        Text("\(roll.date.formatted())")
                        
                        VStack {
                            Text("Total:")
                                .font(.title3.bold())
                            Text("\(roll.total)")
                                .bold()
                        }
                    }
                }
            }
            .navigationTitle("Roll History")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingConfirmation = true
                    } label: {
                        Text("Sort")
                    }
                }
            }
            .confirmationDialog("Sort People", isPresented: $viewModel.showingConfirmation) {
                Button("Date in descending order") { viewModel.sort = .dateDescending }
                Button("Date in ascending order") { viewModel.sort = .dateAscending }
                Button("Max possible roll") { viewModel.sort = .max }
                Button("Total sum of each roll") { viewModel.sort = .sum }
                Button("Cancel", role: .cancel) {  }
            } message: {
                Text("Select the way rolls are sorted")
            }
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
