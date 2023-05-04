//
//  StatsView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct StatsView: View {
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack {
                LimboLogoWithPointsView()
                
                
                
                Spacer()
                
                NavbarView(homeIcon: "homeIconWhite", quizIcon: "quizIconWhite", statsIcon: "statsIconGradient", profileIcon: "profileIconWhite")
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
