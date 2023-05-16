//
//  ContentView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct MainView: View {
    @State private var activeTab: Tab = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        VStack {
            TabView(selection: $activeTab) {
                HomeView()
                    .tag(Tab.home)
                
                TopicView()
                    .tag(Tab.quiz)
                
                StatsView()
                    .tag(Tab.stats)
                
                ProfileView()
                    .tag(Tab.profile)
            }
            .accentColor(Color("orangeColor"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
