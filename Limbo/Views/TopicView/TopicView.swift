//
//  TopicView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 03/05/2023.
//

import SwiftUI

struct TopicView: View {
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack() {
                LimboLogoWithPointsView()
                
                Text("Rozdziały")
                    .font(.custom("Montserrat", size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(K.greenGradient, lineWidth: 3)
                        .frame(height: 120)
                        .padding(.trailing, 25)
                        .padding(.leading, 25)
                    
                    HStack(spacing: 40) {
                        TopicTitleView(title: "Operacje na danych", points: 15, pointsColor: Color("greenColor"))
                        TopicCircleView(percent: 100, title: "Gratulacje!", gradient: K.greenGradient, mainColor: Color("greenColor"), circleIcon: Image("checkmarkIcon"))
                    }
                }
                .padding(.bottom, 15)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(K.orangeGradient, lineWidth: 3)
                        .frame(height: 120)
                        .padding(.trailing, 25)
                        .padding(.leading, 25)
                    
                    HStack(spacing: 40) {
                        TopicTitleView(title: "Instrukcje warunkowe", points: 7, pointsColor: Color("orangeColor"))
                        TopicCircleView(percent: 47, title: "Gratulacje!", gradient: K.orangeGradient, mainColor: Color("orangeColor"), circleIcon: Image("checkmarkIcon"))
                    }
                }
                
                Spacer()
            }
        }
    }
}

struct TopicView_Previews: PreviewProvider {
    static var previews: some View {
        TopicView()
    }
}

struct TopicCircleView: View {
    var percent: Int
    var title: String
    var gradient: LinearGradient
    var mainColor: Color
    var circleIcon: Image
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color("backgroundColor"))
                .frame(width: 75, height: 75)
                .shadow(color: mainColor,radius: 15)
            
            RoundedRectangle(cornerRadius: 50)
                .stroke(gradient, lineWidth: 4.5)
                .frame(width: 75, height: 75)
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(mainColor)
                .frame(width: 20, height: 20)
                .padding(.bottom, 75)
            
            circleIcon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 12, height: 12)
                .padding(.bottom, 75)
            
            VStack {
                Text("\(percent)%")
                    .font(.custom("Montserrat", size: 15))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.custom("Montserrat", size: 10))
                    .fontWeight(.light)
                    .foregroundColor(.white)
            }
        }
    }
}

struct TopicTitleView: View {
    var title: String
    var points: Int
    var pointsColor: Color
    
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.custom("Montserrat", size: 15))
                .fontWeight(.semibold)
                .foregroundColor(.white)
            
            Text("Zdobyte punkty")
                .font(.custom("Montserrat", size: 12))
                .fontWeight(.medium)
                .foregroundColor(.white)
            
            Text("\(points)/15")
                .font(.custom("Montserrat", size: 20))
                .fontWeight(.semibold)
                .foregroundColor(pointsColor)
        }
    }
}
