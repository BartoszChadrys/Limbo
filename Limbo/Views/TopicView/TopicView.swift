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
            VStack {
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
                        VStack(spacing: 10) {
                            Text("Operacje na danych")
                                .font(.custom("Montserrat", size: 15))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                            
                            Text("Zdobyte punkty")
                                .font(.custom("Montserrat", size: 12))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            
                            Text("15/15")
                                .font(.custom("Montserrat", size: 20))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("greenColor"))
                        }
                        
                        TopicCircleView(percent: 100, title: "Gratulacje!", gradient: K.greenGradient, circleColor: Color("greenColor"), circleIcon: Image("checkmarkIcon"))
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
    var circleColor: Color
    var circleIcon: Image
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 50)
                .stroke(gradient, lineWidth: 4.5)
                .foregroundColor(.white)
                .frame(width: 75, height: 75)
            
            RoundedRectangle(cornerRadius: 50)
                .foregroundColor(circleColor)
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
