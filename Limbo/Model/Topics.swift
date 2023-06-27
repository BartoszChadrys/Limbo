//
//  Topics.swift
//  Limbo
//
//  Created by Bartek Chadryś on 23/06/2023.
//

import Foundation

class Topics: ObservableObject {
    @Published var topicsArray: [topicModel] = [
        .init(title: "Operacje na danych", maxPoints: 15, status: .done),
        .init(title: "Instrukcje warunkowe", maxPoints: 15, status: .inProgress),
        .init(title: "Instrukcje iteracyjne", maxPoints: 15, status: .locked),
        .init(title: "Tablice jednowymiarowe", maxPoints: 15, status: .locked),
        .init(title: "Tablice wielowymiarowe", maxPoints: 15, status: .locked),
        .init(title: "Funkcje", maxPoints: 15, status: .locked),
        .init(title: "Rekurencja", maxPoints: 15, status: .locked),
        .init(title: "Sortowanie", maxPoints: 15, status: .locked),
        .init(title: "Wskaźniki", maxPoints: 15, status: .locked),
        .init(title: "Teksty i napisy", maxPoints: 15, status: .locked),
        .init(title: "Zadania ogólnorozwojowe", maxPoints: 15, status: .locked)
    ]
    
    func prepareTopics() -> [topicModel] {
        var topTopicsArray: [topicModel] = []
        for i in 0..<4 {
//            if topicsArray[i].status == .inProgress {
//                topTopicsArray.append(topicsArray[i])
//            }
            topTopicsArray.append(topicsArray[i])
        }
        return topTopicsArray
    }
}

struct topicModel: Hashable {
    let title: String
    let maxPoints: Int
    let status: topicStatusEnum
}

enum topicStatusEnum {
    case done, inProgress, locked
}
