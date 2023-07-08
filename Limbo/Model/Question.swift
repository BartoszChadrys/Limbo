//
//  Question.swift
//  Limbo
//
//  Created by Bartek Chadryś on 06/07/2023.
//

import Foundation

struct Question {
    var text: String
    var answers: [Int: String]
    var correctAnswers: Set<Int>
}
