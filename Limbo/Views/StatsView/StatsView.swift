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
            VStack(spacing: 15) {
                LimboLogoWithPointsView()
                
                VStack {
                    Text("Twoja aktywność w tym tygodniu")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(3)
                    
                    ActivityChartView(activityModel: activityModel)
                }
                
                VStack(spacing: 20) {
                    StatsRectangleView(title: "Wykonanych pytań", score: "25")
                    StatsRectangleView(title: "Ukończonych działów", score: "1")
                    StatsRectangleView(title: "Średni czas na pytanie", score: "5,5s")
                    StatsRectangleView(title: "Najwięcej pytań w ciągu dnia", score: "15")
                }
                .padding(.top, 15)
                
                VStack {
                    Text("Otrzymane bonusy")
                        .font(.custom("Montserrat", size: 16))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    
                    HStack(spacing: 35) {
                        BonusRectangleView(title: "Dodatkowe punkty na egzaminie", points: 21)
                            .padding(.leading, 15)
                        
                        BonusRectangleView(title: "Dodatkowe punkty w Dante", points: 37)
                            .padding(.trailing, 15)
                    }
                }
                
                
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

struct StatsRectangleView: View {
    var title: String
    var score: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(LinearGradient.orangeGradient(), lineWidth: 1.5)
                .frame(height: 50)
                .padding(.leading, 15)
                .padding(.trailing, 15)
            
            HStack() {
                Text(title)
                    .font(.custom("Montserrat", size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 35)
                
                Text(score)
                    .font(.custom("Montserrat", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 45)
            }
            
        }
    }
}

struct BonusRectangleView: View {
    var title: String
    var points: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(LinearGradient.orangeGradient(), lineWidth: 1.5)
                .frame(height: 120)
            
            VStack(spacing: 5) {
                Text("+\(points)")
                    .font(.custom("Montserrat", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.custom("Montserrat", size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
