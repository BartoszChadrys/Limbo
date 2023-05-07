//
//  ContentView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var activeTab = 0

    var body: some View {
        TabView(selection: $activeTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
                .tag(0)
            TopicView()
                .tabItem {
                    Image(systemName: "timer")
                }
                .tag(1)
            StatsView()
                .tabItem {
                    Image(systemName: "chart.dots.scatter")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .accentColor(.orange)
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
