//
//  HomeViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 28/04/2023.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var imageList = ["exampleAvatar"]
    @Published var activityArray: [activityModel] = [
        .init(date: Date.from(year: 2023, month: 5, day: 1), activityCount: 5),
        .init(date: Date.from(year: 2023, month: 5, day: 2), activityCount: 2),
        .init(date: Date.from(year: 2023, month: 5, day: 3), activityCount: 7),
        .init(date: Date.from(year: 2023, month: 5, day: 4), activityCount: 4),
        .init(date: Date.from(year: 2023, month: 5, day: 5), activityCount: 3),
        .init(date: Date.from(year: 2023, month: 5, day: 6), activityCount: 1),
        .init(date: Date.from(year: 2023, month: 5, day: 7), activityCount: 10)]
}

struct activityModel: Identifiable {
    let id = UUID()
    let date: Date
    let activityCount: Int
}

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let components = DateComponents(year: year, month: month, day: day)
        return Calendar.current.date(from: components)!
    }
}
