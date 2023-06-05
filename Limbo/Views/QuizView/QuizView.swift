//
//  QuizView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 01/06/2023.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack {
                LimboLogoWithPointsView()
                
                HStack(spacing: 30) {
                    RectangleTimerView(fillPercent: 0.7)
                    
                    QuestionNumberView(questionNumber: "3/10")
                }

                Spacer()
                
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}

struct RectangleTimerView: View {
    var fillPercent: Double
    
    var body: some View {
        ZStack(alignment: .trailing) {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .frame(width: 250, height: 40)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient.orangeGradient())
                    .frame(width: 250 * fillPercent, height: 40)
            }
            Image(systemName: "clock")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
                .padding(.trailing, 15)
        }
    }
}

struct QuestionNumberView: View {
    var questionNumber: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(LinearGradient.orangeGradient())
                .frame(width: 65, height: 40)
            
            Text(questionNumber)
                .font(.custom("Montserrat", size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}
