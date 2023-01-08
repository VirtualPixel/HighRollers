//
//  HistoryView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var rolls: Rolls
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(rolls.rolls) { roll in
                    NavigationLink {
                        DieRolledView(roll: roll)
                    } label: {
                        HStack {
                            Die(result: roll.maxRoll)
                                .frame(width: 70, height: 70)
                                .padding(.horizontal, 5)
                            
                            Text("\(roll.date.formatted())")
                            
                            Spacer()
                            
                            VStack {
                                Text("Total:")
                                    .font(.title3.bold())
                                Text("\(roll.total)")
                                    .bold()
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    rolls.remove(at: indexSet)
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
                Button("Sort by Date (Ascending)") { viewModel.sort = .dateAscending }
                Button("Sort by Date (Desending") { viewModel.sort = .dateDescending }
                Button("Max possible roll") { viewModel.sort = .max }
                Button("Total sum of each roll") { viewModel.sort = .sum }
                Button("Cancel", role: .cancel) {  }
            } message: {
                Text("Select the way rolls are sorted")
            }
        }
        .onChange(of: viewModel.sort) { _ in
            rolls.sort(newOrder: rolls.rolls.sorted(by: viewModel.sortRolls))
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static let rolls = Rolls()
    
    static var previews: some View {
        HistoryView()
            .environmentObject(rolls)
    }
}
