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
                .padding(.top, 50)
                
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        TextFieldViewWithUserIcon(email: $viewModel.email)
                        
                        CheckBoxView(isCheckboxPressed: $viewModel.isCheckboxPressed)
                        
                        if viewModel.isCheckboxPressed {
                            TextFieldView(title: "Numer albumu",
                                        holdText: $viewModel.indexNumber)
                        }
                        TextFieldView(title: "Imię i nazwisko",
                                    holdText: $viewModel.name)
                        
                        RegisterSecureFieldViewWithEyeIcon(
                                    localViewModel: viewModel,
                                    password: $viewModel.password)
                        SecureFieldView(title: "Powtórz Hasło",
                                      holdText: $viewModel.repeatedPassword)
                    }
                }
                .frame(maxHeight: 310)
                .padding(.bottom, 15)
                
                Spacer()
                
                VStack {
                    Button() {
                        viewModel.showMainView.toggle()
                    } label: {
                        GradientButton(text: "Załóż konto")
                            .frame(width: 250, height: 60)
                    }
                    .padding(.bottom, 10)
                    .fullScreenCover(isPresented: $viewModel.showMainView) {
                        MainView()
                    }
                    
                    HStack(spacing: 5) {
                        Text("Masz już konto?")
                            .font(.custom("Montserrat", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Button() {
                            viewModel.showLoginView.toggle()
                        } label: {
                            Text("Zaloguj się")
                                .font(.custom("Montserrat", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(Color("orangeColor"))
                        }
                        .fullScreenCover(isPresented: $viewModel.showLoginView) {
                            LoginView()
                        }
                    }
                }
                .padding(.bottom, 60)
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

struct CheckBoxView: View {
    @Binding var isCheckboxPressed: Bool
    
    var body: some View {
        HStack() {
            Button() {
                isCheckboxPressed.toggle()
            } label: {
                if isCheckboxPressed {
                    Image(systemName: "checkmark.square.fill")
                        .foregroundColor(.white)
                } else {
                    Image(systemName: "square")
                        .foregroundColor(Color("backgroundBoxColor"))
                }
            }
            .frame(width: 20, height: 20)
            .padding(.leading, 10)
            
            Text("Jestem studentem Politechniki Łódzkiej")
                .font(.custom("Montserrat", size: 10))
                .foregroundColor(.white)
        }
    }
}
