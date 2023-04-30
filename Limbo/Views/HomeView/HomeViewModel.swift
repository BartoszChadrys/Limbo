//
//  HomeViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 28/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var imageList = ["exampleAvatar"]
    @Published var activityArray: [activityModel] = [
        .init(date: Date.from(day: 1), activityCount: 5),
        .init(date: Date.from(day: 2), activityCount: 2),
        .init(date: Date.from(day: 3), activityCount: 7),
        .init(date: Date.from(day: 4), activityCount: 4),
        .init(date: Date.from(day: 5), activityCount: 3),
        .init(date: Date.from(day: 6), activityCount: 1),
        .init(date: Date.from(day: 7), activityCount: 10)]
}

struct activityModel: Identifiable {
    let id = UUID()
    let date: Date
    let activityCount: Int
}

extension Date {
    static func from(day: Int) -> Date {
        let components = DateComponents(day: day)
        return Calendar.current.date(from: components)!
    }
}
