//
//  QuizViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 01/06/2023.
//

import SwiftUI

class QuizViewModel: ObservableObject {
//    @FetchRequest(sortDescriptors: []) var questions: FetchedResults<Questions>
//    @Environment(\.managedObjectContext) var moc
    
    @State var timer: Timer? = Timer()
    @Published var timePerQuestion: Double = 10
    @Published var timeAfterAnswer: Double = 1.5
    
    @Published var currentCheckedAnswers: [Bool] = [false, false, false, false]
    @Published var correctBoolAnswers: [Bool?] = [nil, nil, nil, nil]
    @Published var currentAnswers: [Int : String] = [:]
    
    @Published var currentQuestionNumber = 0
    @Published var questions: [Question] = [
        Question(id: UUID(),text: "Która funkcja jest poprawnie wywołana?", answers: [1: "printf(“Hello)", 2: "printf(“%.1f”,1.56)", 3: "printf(“%s”)", 4: "printf(Hello world)"], correctAnswers: Set(["printf(“%.1f”,1.56)"])),
        Question(id: UUID(),text: "Które funkcje/metody znajdują się w języku C?", answers: [1: ".contain", 2: "cout", 3: "scanf", 4: "sscanf"], correctAnswers: Set(["scanf", "sscanf"])),
        Question(id: UUID(), text: "Jak wygląda operator logiczny \"lub\" w języku C?", answers: [1: "or", 2: "||", 3: "&&", 4: "OR"], correctAnswers: Set(["||"])),
        Question(id: UUID(), text: "Jaki jest symbol używany do komentarzy jednoliniowych w języku C?", answers: [1: "//", 2: "\\", 3: "#", 4: "$"], correctAnswers: Set(["//"])),
        Question(id: UUID(), text: "Które funkcje używa się do dynamicznej alokacji pamięci w języku C?", answers: [1: "malloc", 2: "calloc", 3: "alloc", 4: "dealloc"], correctAnswers: Set(["malloc", "calloc"]))
    ]
    
    func continueButtonClicked() {
        stopTimer()
        resetQuestionData()
        changeQuestionNumber()
    }
    
    func resetQuestionData() {
        currentAnswers = [:]
        currentCheckedAnswers = [false, false, false, false]
        correctBoolAnswers = [nil, nil, nil, nil]
    }
    
    func changeQuestionNumber() {
        if currentQuestionNumber < questions.count-1 {
            currentQuestionNumber += 1
        } else {
            currentQuestionNumber = 0
        }
    }
    
    func checkAnswers() {
        for answer in currentAnswers {
            if questions[currentQuestionNumber].correctAnswers.contains(answer.value) {
                correctBoolAnswers[answer.key] = true
            } else {
                correctBoolAnswers[answer.key] = false
            }
        }
    }
    
    func startTimer() {
        resetTime()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.timePerQuestion -= 0.1
        }
    }
    
    func resetTime() {
        timePerQuestion = 10
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
