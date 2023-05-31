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
    @Published var isPasswordHidden: Bool = true
    @Published var isValid: Bool = true
    @Published var errorText: String = ""
    
    @Published var user: User?
    
    @Published var showLoginView: Bool = false
    @Published var showMainView: Bool = false
    @Published var isCheckboxPressed: Bool = false
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

//MARK: - Check user information

extension RegisterViewModel {
    func checkUserInfo() -> Bool {
        if checkName(), checkEmail(), checkPassword() {
            return true
        }
        return false
    }
    
    func checkPassword() -> Bool {
        if password != repeatedPassword {
            errorText = "Podane hasła się różnią!"
            return false
        } else if password.count < 6 {
            errorText = "Hasło musi mieć conajmniej 6 znaków!"
            return false
        }
        return true
    }
    
    func checkEmail() -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        if !emailPred.evaluate(with: email) {
            errorText = "Zły format email!"
            return false
        }
        return true
    }
    
    func checkName() -> Bool {
        if name == "" {
            errorText = "Błędne imie i nazwisko!"
            return false
        }
        return true
    }
}
