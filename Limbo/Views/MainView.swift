//
//  ContentView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct MainView: View {
    @State private var activeTab = 0
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "backgroundBoxColor")
        UITabBar.appearance().backgroundColor = UIColor(named: "backgroundBoxColor")
    }

    var body: some View {
        TabView(selection: $activeTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
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
        .accentColor(Color("orangeColor"))
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
