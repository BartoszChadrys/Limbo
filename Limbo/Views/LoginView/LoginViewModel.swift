//
//  LoginViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 22/04/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordHidden = true
    
    @Published var showRegisterView = false
    @Published var showMainView = false
}
