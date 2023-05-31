//
//  RegisterViewModel.swift
//  Limbo
//
//  Created by Bartek Chadryś on 24/04/2023.
//

import Foundation
import FirebaseAuth

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var indexNumber: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    @Published var isPasswordHidden = true
    @Published var user: User?
    
    @Published var showLoginView = false
    @Published var showMainView = false
    @Published var isCheckboxPressed = false
}

//MARK: - Register authentication

extension RegisterViewModel {
    func signUp() async -> Bool {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            user = authResult.user
            print("User \(authResult.user.uid) signed up")
            return true
        } catch {
            print(error)
            return false
        }
    }
}
