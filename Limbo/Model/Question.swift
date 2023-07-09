//
//  Question.swift
//  Limbo
//
//  Created by Bartek Chadryś on 06/07/2023.
//

import Foundation

struct Question: Identifiable {
    var id: UUID
    var text: String
    var answers: [Int: String]
    var correctAnswers: Set<String>
}
