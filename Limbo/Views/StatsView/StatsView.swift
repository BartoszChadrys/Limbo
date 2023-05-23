//
//  StatsView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct StatsView: View {
    @StateObject private var activityModel = Activity()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack {
                LimboLogoWithPointsView()
                
                ActivityChartView(activityModel: activityModel)
                
                Spacer()                
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
