//
//  ContentView.swift
//  HighRollers
//
//  Created by Justin Wells on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var rolls = Rolls()
    
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
        }
        .environmentObject(rolls)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
