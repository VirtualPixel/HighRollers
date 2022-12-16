//
//  ContentView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/12/22.
//

import SwiftUI
import WrappingHStack

struct ContentView: View {
    var body: some View {
        TabView {
            RollView()
                .tabItem {
                    Label("Roll", systemImage: "dice")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "book")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
