//
//  HomeViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 28/04/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var imageList = ["exampleAvatar"]
    @Published var activityArray = []
}

struct activityModel: Identifiable {
    let id = UUID()
    let date: Date
    let activityCount: Int
}
