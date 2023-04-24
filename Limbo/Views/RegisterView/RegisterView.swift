//
//  RegisterView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 22/04/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack {
                LimboLogoView()
                
                Spacer()
                
                VStack {
                    Text("Rejestracja")
                        .font(.custom("Montserrat", size: 40))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 15) {
                    TextFieldView(title: "Email użytkownika", holdText: $viewModel.email)
                    TextFieldView(title: "Numer albumu", holdText: $viewModel.indexNumber)
                    TextFieldView(title: "Imię i nazwisko", holdText: $viewModel.name)
                    
                    SecureFieldView(title: "Hasło", holdText: $viewModel.password)
                    SecureFieldView(title: "Powtórz Hasło", holdText: $viewModel.repeatedPassword)
                }
                
                Spacer()
            }
        }
    }
}

struct RegisterView_Preview: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
