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
    
    @Published var questions: [Question] = [
        Question(text: "Która funkcja jest poprawnie wywołana", answers: [1: "printf(“Hello)", 2: "printf(“%.1f”,1.56)", 3: "printf(“%s”)", 4: "printf(Hello world)"], correctAnswers: Set([2])),
        Question(text: "Które funkcje/metody znajdują się w języku C", answers: [1: ".contain", 2: "cout", 3: "scanf", 4: "sscanf"], correctAnswers: Set([3,4]))
    ]
}
