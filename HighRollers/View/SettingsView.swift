//
//  SettingsView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/16/22.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            Text("Settings")
                .navigationTitle("Settings")
        }
    }
    
    init() {
        _viewModel = StateObject(wrappedValue: ViewModel())
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
