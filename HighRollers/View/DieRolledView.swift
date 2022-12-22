//
//  DieRolledView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/22/22.
//

import SwiftUI

struct DieRolledView: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Text("Max Roll")
                    .font(.title.bold())
                Die(result: viewModel.roll.maxRoll)
                    .frame(width: geo.size.width * 0.7)
                
            }
            .padding()
            .position(x: geo.size.width / 2, y: geo.size.height / 2)
        }
    }
    
    init(roll: Roll) {
        _viewModel = StateObject(wrappedValue: ViewModel(roll: roll))
    }
}

struct DieRolledView_Previews: PreviewProvider {
    static var previews: some View {
        DieRolledView(roll: Roll.example)
    }
}
