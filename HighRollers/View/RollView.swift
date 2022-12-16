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
                Die()
                    .padding()
            }
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
