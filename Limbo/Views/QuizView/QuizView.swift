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
            // TODO: Fix background gradient
            // LinearGradient.yellowGradient()
            VStack(spacing: 30) {
                LimboLogoWithPointsView()
                
                HStack(spacing: 30) {
                    RectangleTimerView(fillPercent: 0.7)
                    
                    QuestionNumberView(questionNumber: "3/10")
                }
                
                QuestionTextView(text: "Która funkcja jest poprawnie wywołana?")
                
                VStack(spacing: 30) {
                    AnswerRectangleView(text: "printf(\"Hello)")
                    AnswerRectangleView(text: "printf(“%.1f”,1.56)")
                    AnswerRectangleView(text: "printf(“%s”)")
                    AnswerRectangleView(text: "printf(Hello world)")
                }
                .padding(.top, 20)
                
                Button {
                    
                } label: {
                    GradientButton(text: "Kontynuuj")
                        .frame(width: 250, height: 60)
                        .padding(.top, 60)
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

struct QuestionTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Montserrat", size: 20))
            .fontWeight(.medium)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}

struct AnswerRectangleView: View {
    var text: String
    
    var body: some View {
        ZStack {
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(LinearGradient.orangeGradient(), lineWidth: 1.75)
                    .frame(width: 200, height: 45)
                
                Circle()
                    .stroke(LinearGradient.orangeGradient())
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 15)
            }
            
            Text(text)
                .font(.custom("Montserrat", size: 13))
                .fontWeight(.medium)
                .foregroundColor(.white)
                .padding(.trailing, 20)
        }
    }
}
