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
    @Published var quizTime: Double = 10
    @Published var currentQuestionNumber = 0
    @Published var questions: [Question] = [
        Question(id: UUID(),text: "Która funkcja jest poprawnie wywołana?", answers: [1: "printf(“Hello)", 2: "printf(“%.1f”,1.56)", 3: "printf(“%s”)", 4: "printf(Hello world)"], correctAnswers: Set([2])),
        Question(id: UUID(),text: "Które funkcje/metody znajdują się w języku C?", answers: [1: ".contain", 2: "cout", 3: "scanf", 4: "sscanf"], correctAnswers: Set([3,4])),
        Question(id: UUID(), text: "Jak wygląda operator logiczny \"lub\" w języku C?", answers: [1: "or", 2: "||", 3: "&&", 4: "OR"], correctAnswers: Set([2])),
        Question(id: UUID(), text: "Jaki jest symbol używany do komentarzy jednoliniowych w języku C?", answers: [1: "//", 2: "\\", 3: "#", 4: "$"], correctAnswers: Set([1])),
        Question(id: UUID(), text: "Które funkcje używa się do dynamicznej alokacji pamięci w języku C?", answers: [1: "malloc", 2: "calloc", 3: "alloc", 4: "dealloc"], correctAnswers: Set([1,2]))
    ]
    
    func startTimer() {
        quizTime = 10
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            self.quizTime -= 0.1
            }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
