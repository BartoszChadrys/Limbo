//
//  Topics.swift
//  Limbo
//
//  Created by Bartek Chadryś on 23/06/2023.
//

import Foundation

class Topics: ObservableObject {
    @Published var topicsArray: [topicModel] = [
        .init(title: "Operacje na danych", maxPoints: 15),
        .init(title: "Instrukcje warunkowe", maxPoints: 15),
        .init(title: "Instrukcje iteracyjne", maxPoints: 15),
        .init(title: "Tablice jednowymiarowe", maxPoints: 15),
        .init(title: "Tablice wielowymiarowe", maxPoints: 15),
        .init(title: "Funkcje", maxPoints: 15),
        .init(title: "Rekurencja", maxPoints: 15),
        .init(title: "Sortowanie", maxPoints: 15),
        .init(title: "Wskaźniki", maxPoints: 15),
        .init(title: "Teksty i napisy", maxPoints: 15),
        .init(title: "Zadania ogólnorozwojowe", maxPoints: 15)
    ]
}

struct topicModel {
    let title: String
    let maxPoints: Int
}
