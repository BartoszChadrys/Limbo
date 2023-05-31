//
//  LoginViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 22/04/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isPasswordHidden: Bool = true
    @Published var isValid: Bool = true
    @Published var user: User?
    
    @Published var showRegisterView: Bool = false
    @Published var showMainView: Bool = false
}

//MARK: - Login authentication

extension LoginViewModel {
    func signIn() async -> Bool {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            user = authResult.user
            print("User \(authResult.user.uid) signed in")
            return true
        } catch {
            print(error)
            return false
        }
    }
}
