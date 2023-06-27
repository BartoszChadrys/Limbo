//
//  TopicView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 03/05/2023.
//

import SwiftUI

struct TopicView: View {
    @StateObject private var alertModel = Alerts()
    @StateObject private var topicModel = Topics()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack(spacing: 15) {
                LimboLogoWithPointsView(alertModel: alertModel)
                
                ScrollView {
                    VStack {
                        ForEach(topicModel.topicsArray, id: \.self) { topic in
                            if topic.status == .done {
                                TopicElementView(gradient: K.doneGradient, mainColor: K.doneColor, topicTitle: topic.title, points: 15, circleTitle: "Gratulacje!", circleIcon: K.doneIcon, percent: 100)
                            } else if topic.status == .inProgress {
                                TopicElementView(gradient: K.progressGradient, mainColor: K.progressColor, topicTitle: topic.title, points: 10, circleTitle: "Kliknij, aby wykonać quiz", circleIcon: K.progressIcon, percent: 67)
                            } else {
                                TopicElementView(gradient: K.lockGradient, mainColor: K.lockColor, topicTitle: topic.title, points: 0, circleTitle: "Zablokowane", circleIcon: K.lockIcon, percent: 0)
                            }
                        }
                    }
                    .padding(.top, 3)
                    .padding(.bottom, 3)
                }
                .scrollIndicators(.hidden)
                .padding(.bottom, K.navbarBottomPadding)
                
                Spacer()                
            }
        }
        .overlay {
            if alertModel.showPointsAlert {
                PointsAlertView(alertModel: alertModel)
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
    @State var drawProgress = false
    
    var body: some View {
        ZStack() {
            Circle()
                .foregroundColor(.backgroundColor())
                .frame(width: 75, height: 75)
                .shadow(color: mainColor,radius: 15)
            
            Circle()
                .trim(from: 0, to: drawProgress ? CGFloat(percent)/100 : 0)
                .stroke(gradient, style: StrokeStyle(lineWidth: 4.5, lineCap: .round))
                .frame(width: 75, height: 75)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: drawProgress)
                .onAppear {
                    drawProgress = true
                }
                .onDisappear {
                    drawProgress = false
                }
            
            Circle()
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
                    .font(.custom("Montserrat", size: 8))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 53)
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
                .frame(width: 200)
                .multilineTextAlignment(.center)
            
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

struct TopicElementView: View {
    var gradient: LinearGradient
    var mainColor: Color
    var topicTitle: String
    var points: Int
    var circleTitle: String
    var circleIcon: Image
    var percent: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(gradient, lineWidth: 3)
                .frame(height: 120)
                .padding(.trailing, 25)
                .padding(.leading, 25)
            
            HStack(spacing: 20) {
                TopicTitleView(title: topicTitle, points: points, pointsColor: mainColor)
                
                TopicCircleView(percent: percent, title: circleTitle, gradient: gradient, mainColor: mainColor, circleIcon: circleIcon)
            }
        }
        .padding(.bottom, 15)
    }
}
