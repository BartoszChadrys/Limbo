//
//  HomeView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 28/04/2023.
//

import SwiftUI
import Charts

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var activityModel = Activity()
    @StateObject private var alertModel = Alerts()
    @StateObject private var topicModel = Topics()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            
            VStack(spacing: 15) {
                LimboLogoWithPointsView(alertModel: alertModel, hasQuiz: false)
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Najlepsi w grupie")
                            .sectionTextStyle()
                        
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 25) {
                                ForEach(viewModel.imageList, id: \.self) { image in
                                    PersonInfoView(image: image)
                                }
                            }
                        }
                    }
                    .padding(.leading, 15)
                    
                    VStack(alignment: .leading) {
                        Text("Statystyki")
                            .sectionTextStyle()
                        
                        VStack {
                            Text("Twoja aktywność w tym tygodniu")
                                .font(.custom("Montserrat", size: 14))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(3)
                            
                            ActivityChartView(activityModel: activityModel)
                        }
                    }
                    .padding(.leading, 15)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Nauka")
                            .sectionTextStyle()
                            .padding(.leading, 15)
                            .padding(.bottom, 5)
                        
                        ZStack {
                            Rectangle()
                                .padding(.leading, 15)
                                .foregroundColor(.backgroundColor())
                            
//                            ForEach(topicModel.prepareTopics(), id: \.self) { topic in
//
//                                TopicRectangleView(percent: 50, title: topic.title, gradient: K.progressGradient, circleColor: K.progressColor, circleIcon: K.progressIcon)
//                            }
                            
                            VStack(spacing: 15) {
                                HStack(spacing: K.topicsHomeViewPadding) {
                                    TopicRectangleView(percent: 100, title: "Operacje na danych", gradient: K.doneGradient, circleColor: K.doneColor, circleIcon: K.doneIcon)
                                    
                                    TopicRectangleView(percent: 47, title: "Instrukcje warunkowe", gradient: K.progressGradient, circleColor: K.progressColor, circleIcon: K.progressIcon)
                                }
                                
                                HStack(spacing: K.topicsHomeViewPadding) {
                                    TopicRectangleView(percent: 0, title: "Instrukcje iteracyjne", gradient: K.lockGradient, circleColor: K.lockColor, circleIcon: K.lockIcon)
                                    
                                    TopicRectangleView(percent: 0, title: "Tablice jednowymiarowe", gradient: K.lockGradient, circleColor: K.lockColor, circleIcon: K.lockIcon)
                                }
                            }
                            .padding(.leading, 15)
                            .padding(.trailing, 15)
                            .padding(.bottom, 3)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.bottom, K.navbarBottomPadding)
            }
        }
        .overlay {
            if alertModel.showPointsAlert {
                PointsAlertView(alertModel: alertModel)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension View {
    func sectionTextStyle() -> some View {
        modifier(SectionTextModifier())
    }
}

struct SectionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Montserrat", size: 20))
            .fontWeight(.medium)
            .foregroundColor(.white)
    }
}

struct PersonInfoView: View {
    var image: String
    
    var body: some View {
        VStack {
            ZStack {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                
                ZStack() {
                    Rectangle()
                        .frame(width: 40, height: 25)
                        .foregroundColor(.backgroundBoxColor())
                        .cornerRadius(20)
                        .opacity(0.8)
                    
                    HStack(spacing: 3) {
                        Image("flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15, alignment: .leading)
                        Text("50")
                            .font(.custom("Montserrat", size: 10))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                }
                .padding(.leading, 30)
                .padding(.top, 45)
            }
            
            Text("Ty")
                .font(.custom("Montserrat", size: 12))
                .fontWeight(.semibold)
                .foregroundColor(.orangeColor())
        }
    }
}

struct PointsView: View {
    var points: Int
    var alertModel: Alerts
    
    var body: some View {
        Button {
            alertModel.showPointsAlert.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .frame(width: 65, height: 35)
                    .foregroundColor(.backgroundBoxColor())
                    .cornerRadius(20)
                HStack() {
                    Image("flame")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20, alignment: .leading)
                    Text("\(points)")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 35, alignment: .leading)
            .padding(.leading, 15)
        }
    }
}

struct PointsAlertView: View {
    var alertModel: Alerts
    
    var body: some View {
        ZStack {
            Button {
                alertModel.showPointsAlert = false
            } label: {
                Color.black
                    .opacity(0.75)
            }
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.backgroundColor())
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(LinearGradient.orangeGradient(), lineWidth: 1.5)
                            .frame(width: K.alertWidth, height: K.pointsAlertHeight)
                    })
                    .frame(width: K.alertWidth, height: K.pointsAlertHeight)
                
                Button {
                    alertModel.showPointsAlert.toggle()
                } label: {
                    Text("X")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 110)
                        .padding(.trailing, 15)
                }
                
                VStack(spacing: 15) {
                    HStack {
                        Image("flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        Text("Co to za punkty?")
                            .font(.custom("Montserrat", size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.top, 10)
                    
                    Text("Punkty możesz wymieniać na nagrody, np. dodatkowe punkty na egzaminie lub w dziale. Dodatkowo dzięki tym punktom tworzymy ranking osób w twojej grupie.")
                        .font(.custom("Montserrat", size: 14))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 250)
                        .minimumScaleFactor(0.5)
                        .padding(.bottom, 10)
                }
                .frame(width: K.alertWidth, height: K.pointsAlertHeight)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct AnnotationView: View {
    var points: Int
    
    var body: some View {
        ZStack {
            Image("bubblePointsChart")
                .resizable()
                .frame(width: 33, height: 25)
                .foregroundColor(.backgroundBoxColor())
                .cornerRadius(5)
            
            HStack(spacing: 3) {
                Image("flame")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 10, height: 10)
                Text("\(points)")
                    .font(.custom("Montserrat", size: 10))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 4)
        }
    }
}

struct RoundedRectangleView: View {
    var gradient: LinearGradient
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .stroke(gradient, lineWidth: 3)
            .frame(height: 90)
            .foregroundColor(.backgroundBoxColor())
    }
}

struct TopicRectangleView: View {
    var percent: Int
    var title: String
    var gradient: LinearGradient
    var circleColor: Color
    var circleIcon: Image
    @State var drawProgress: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangleView(gradient: gradient)
            VStack(spacing: 0) {
                ZStack {
                    Circle()
                        .trim(from: 0, to: drawProgress ? CGFloat(percent)/100 : 0)
                        .stroke(gradient, style: StrokeStyle(lineWidth: 4.5, lineCap: .round))
                        .foregroundColor(.white)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 45, height: 45)
                        .animation(.easeOut, value: drawProgress)
                        .onAppear {
                            drawProgress = true
                        }
                        .onDisappear {
                            drawProgress = false
                        }
                    
                    Circle()
                        .foregroundColor(circleColor)
                        .frame(width: 15, height: 15)
                        .padding(.bottom, 45)
                    
                    circleIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 10, height: 10)
                        .padding(.bottom, 45)
                    
                    Text("\(percent)%")
                        .font(.custom("Montserrat", size: 12))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                Text(title)
                    .font(.custom("Montserrat", size: 9))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
        }
    }
}

struct ActivityChartView: View {
    var activityModel: Activity
    
    var body: some View {
        Chart {
            ForEach(activityModel.activityArray) { activity in
                LineMark(x: .value("Day", activity.date, unit: .day),
                         y: .value("Flickers", activity.activityCount))
                
                PointMark(x: .value("Day", activity.date, unit: .day),
                          y: .value("Flickers", activity.activityCount))
                .foregroundStyle(LinearGradient(colors: [Color("redGradientColor"), Color("yellowGradientColor")],
                                                startPoint: .leading, endPoint: .trailing))
                .annotation {
                    if activity.activityCount == activityModel.activityArray.map({$0.activityCount}).max() {
                        AnnotationView(points: activity.activityCount)
                    }
                }
                
            }
        }
        .frame(maxHeight: 140)
        .foregroundColor(.orangeColor())
        .chartYAxis(.hidden)
        .chartXAxis {
            AxisMarks(values: activityModel.activityArray.map {$0.date}) { date in
                AxisValueLabel(format: .dateTime.weekday(), horizontalSpacing: 15)
                    .foregroundStyle(Color.white)
            }
        }
    }
}

struct LimboLogoWithPointsView: View {
    var alertModel: Alerts
    var hasQuiz: Bool
    
    var body: some View {
        ZStack() {
            PointsView(points: 50, alertModel: alertModel)
                .padding(.top, 40)
            
            LimboLogoView(hasQuiz: hasQuiz)
            
            Image("exampleAvatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 35, alignment: .trailing)
                .padding(.top, 40)
                .padding(.trailing, 15)
        }
        .padding(.top, 35)
    }
}
