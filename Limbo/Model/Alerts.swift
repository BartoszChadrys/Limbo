//
//  Alerts.swift
//  Limbo
//
//  Created by Bartek Chadryś on 13/06/2023.
//

import Foundation

class Alerts: ObservableObject {
    @Published var showPointsAlert: Bool = false
    @Published var showChangePasswordAlert: Bool = false
}
