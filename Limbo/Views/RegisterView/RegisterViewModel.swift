//
//  RegisterViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 24/04/2023.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var indexNumber: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    @Published var isPasswordHidden = true
    
    @Published var showLoginView = false
    @Published var showMainView = false
    @Published var isCheckboxPressed = false
}
