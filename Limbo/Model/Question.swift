//
//  Question.swift
//  Limbo
//
//  Created by Bartek Chadryś on 06/07/2023.
//

import Foundation

struct Question {
    var id: UUID
    var text: String
    var answers = Set<[Int: String]>()
    var correctAnswers = Set<Int>()
}
