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
    
    var body: some View {
        ZStack {
            backgroundColorView()
            
            VStack(spacing: 15) {
                LimboLogoWithPointsView()
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Najlepsi w grupie")
                            .font(.custom("Montserrat", size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
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
                            .font(.custom("Montserrat", size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        VStack {
                            Text("Twoja aktywność w tym tygodniu")
                                .font(.custom("Montserrat", size: 14))
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .padding(3)
                            
                            ActivityChartView(localViewModel: viewModel)
                        }
                    }
                    .padding(.leading, 15)
                    .padding(.top, 5)
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Nauka")
                            .font(.custom("Montserrat", size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .padding(.leading, 15)
                            .padding(.bottom, 3)
                        
                        ZStack {
                            Rectangle()
                                .padding(.leading, 15)
                                .foregroundColor(Color("backgroundColor"))
                            
                            VStack(spacing: 15) {
                                HStack(spacing: 50) {
                                    ZStack {
                                        RoundedRectangleView(gradient: K.greenGradient)
                                        CircleView(percent: 100, title: "Operacje na danych", gradient: K.greenGradient, circleColor: Color("greenColor"), circleIcon: Image("checkmarkIcon"))
                                    }
                                    
                                    ZStack {
                                        RoundedRectangleView(gradient: K.orangeGradient)
                                        CircleView(percent: 47, title: "Instrukcje warunkowe", gradient: K.orangeGradient, circleColor: Color("orangeColor"), circleIcon: Image("flameWhite"))
                                    }
                                }
                                HStack(spacing: 50) {
                                    ZStack {
                                        RoundedRectangleView(gradient: K.redGradient)
                                        CircleView(percent: 0, title: "Instrukcje iteracyjne", gradient: K.redGradient, circleColor: Color("redColor"), circleIcon: Image("lockIcon"))
                                    }
                                    
                                    ZStack {
                                        RoundedRectangleView(gradient: K.redGradient)
                                        CircleView(percent: 0, title: "Tablice jednowymiarowe", gradient: K.redGradient, circleColor: Color("redColor"), circleIcon: Image("lockIcon"))
                                    }
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
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
                        .foregroundColor(Color("backgroundBoxColor"))
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
                .foregroundColor(Color("orangeColor"))
        }
    }
}

struct PointsView: View {
    var points: Int
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 65, height: 35)
                .foregroundColor(Color("backgroundBoxColor"))
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

struct AnnotationView: View {
    var points: Int
    
    var body: some View {
        ZStack {
            Image("bubblePointsChart")
                .resizable()
                .frame(width: 33, height: 25)
                .foregroundColor(Color("backgroundBoxColor"))
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
            .frame(width: 140, height: 90)
    }
}

struct CircleView: View {
    var percent: Int
    var title: String
    var gradient: LinearGradient
    var circleColor: Color
    var circleIcon: Image
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Circle()
                    .trim(from: 0, to: CGFloat(percent)/100)
                    .stroke(gradient, lineWidth: 4.5)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 45, height: 45)
                
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

struct ActivityChartView: View {
    var localViewModel: HomeViewModel
    
    var body: some View {
        Chart {
            ForEach(localViewModel.activityArray) { activity in
                LineMark(x: .value("Day", activity.date, unit: .day),
                         y: .value("Flickers", activity.activityCount))
                
                PointMark(x: .value("Day", activity.date, unit: .day),
                          y: .value("Flickers", activity.activityCount))
                .foregroundStyle(LinearGradient(colors: [Color("redGradientColor"), Color("yellowGradientColor")],
                                                startPoint: .leading, endPoint: .trailing))
                .annotation {
                    if activity.activityCount == 7 {
                        AnnotationView(points: activity.activityCount)
                    }
                }
                
            }
        }
        .frame(maxHeight: 140)
        .foregroundColor(Color("orangeColor"))
        .chartYAxis(.hidden)
        .chartXAxis {
            AxisMarks(values: localViewModel.activityArray.map {$0.date}) { date in
                AxisValueLabel(format: .dateTime.weekday(), horizontalSpacing: 15)
                    .foregroundStyle(Color.white)
            }
        }
    }
}

struct LimboLogoWithPointsView: View {
    var body: some View {
        ZStack() {
            PointsView(points: 50)
                .padding(.top, 40)
            
            LimboLogoView()
            
            Image("exampleAvatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity, maxHeight: 35, alignment: .trailing)
                .padding(.top, 40)
                .padding(.trailing, 15)
        }
        .padding(.top, 25)
    }
}
