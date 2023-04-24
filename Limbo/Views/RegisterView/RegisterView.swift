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
                    TextFieldViewWithUserIcon(email: $viewModel.email)
                    TextFieldView(title: "Numer albumu", holdText: $viewModel.indexNumber)
                    TextFieldView(title: "Imię i nazwisko", holdText: $viewModel.name)
                    
                    RegisterSecureFieldViewWithEyeIcon(
                        localViewModel: viewModel,
                        password: $viewModel.password)
                    SecureFieldView(title: "Powtórz Hasło", holdText: $viewModel.repeatedPassword)
                }
                
                Spacer()
                
                VStack {
                    Button() {
                        print("Tapped gradient button")
                    } label: {
                        GradientButton(text: "Załóż konto")
                            .frame(width: 250, height: 60)
                    }
                    .padding(.bottom, 10)
                    
                    HStack(spacing: 5) {
                        Text("Masz już konto?")
                            .font(.custom("Montserrat", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Text("Zaloguj się")
                            .font(.custom("Montserrat", size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("orangeColor"))
                    }
                }
                .padding(.bottom, 70)
            }
        }
    }
}

struct RegisterView_Preview: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

struct RegisterSecureFieldViewWithEyeIcon: View {
    var localViewModel: RegisterViewModel
    @Binding var password: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if localViewModel.isPasswordHidden {
                SecureFieldView(title: "Hasło", holdText: $password)
                
                Button() {
                    localViewModel.isPasswordHidden.toggle()
                } label: {
                    EyeButton(image: "crossedEyeIcon")
                }
            } else {
                TextFieldView(title: "Hasło", holdText: $password)
                
                Button() {
                    localViewModel.isPasswordHidden.toggle()
                } label: {
                    EyeButton(image: "eyeIcon")
                }
            }
        }
    }
}
