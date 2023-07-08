//
//  QuizView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 01/06/2023.
//

import SwiftUI

struct QuizView: View {
    @StateObject private var alertModel = Alerts()
    @StateObject private var quizModel = QuizViewModel()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            LinearGradient.yellowGradient()
                .opacity(0.2)
            VStack(spacing: 30) {
                LimboLogoWithPointsView(alertModel: alertModel, hasQuiz: true)
                
                HStack(spacing: 30) {
                    RectangleTimerView(fillPercent: quizModel.quizTime/10)
                    
                    QuestionNumberView(questionNumber: "\(quizModel.currentQuestionNumber+1)/5")
                }
                
                QuestionTextView(text: quizModel.questions[quizModel.currentQuestionNumber].text)
                
                VStack(spacing: 30) {
                    ForEach(Array(quizModel.questions[quizModel.currentQuestionNumber].answers.enumerated()), id: \.element.key) { index, answer in
                        AnswerRectangleView(text: answer.value, check: false)
                    }
                }
                .padding(.top, 20)
                
                Button {
                    if quizModel.currentQuestionNumber < quizModel.questions.count-1 {
                        quizModel.currentQuestionNumber += 1
                    } else {
                        quizModel.currentQuestionNumber = 0
                    }
                    quizModel.stopTimer()
                } label: {
                    GradientButton(text: "Kontynuuj")
                        .frame(width: 250, height: 60)
                        .padding(.top, 60)
                }
                
                Spacer()
            }
            .onAppear() {
                quizModel.startTimer()
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
                    .animation(.easeOut, value: fillPercent)
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
            .padding(.trailing, 15)
            .padding(.leading, 15)
    }
}

struct AnswerRectangleView: View {
    var text: String
    @State var check: Bool
    
    var body: some View {
        Button {
            check.toggle()
        } label: {
            ZStack {
                ZStack(alignment: .trailing) {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(LinearGradient.orangeGradient(), lineWidth: 1.75)
                        .frame(width: 200, height: 45)
                    
                    Circle()
                        .stroke(LinearGradient.orangeGradient())
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 15)
                    if check {
                        Circle()
                            .foregroundColor(.orangeColor())
                            .frame(width: 20, height: 20)
                            .padding(.trailing, 15)
                        
                        Image(systemName: "checkmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 10)
                            .foregroundColor(.white)
                            .padding(.trailing, 15)
                    }
                }
                
                Text(text)
                    .font(.custom("Montserrat", size: 13))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.trailing, 20)
            }
        }
    }
}
