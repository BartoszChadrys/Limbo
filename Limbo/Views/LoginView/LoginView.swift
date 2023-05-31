//
//  LoginView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 21/04/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack {
                LimboLogoView()
                
                Spacer()
                
                VStack {
                    Text("Logowanie")
                        .font(.custom("Montserrat", size: 40))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 15) {
                        TextFieldViewWithUserIcon(email: $viewModel.email)
                        
                        LoginSecureFieldViewWithEyeIcon(
                            localViewModel: viewModel,
                            password: $viewModel.password)
                        if !viewModel.isValid {
                            Text("Nieprawidłowy email lub hasło!")
                                .font(.custom("Montserrat", size: 10))
                                .fontWeight(.medium)
                                .foregroundColor(.red)
                        }
                    }
                }
                .padding(.top, 50)
                    
                Spacer()
                
                VStack {
                    Button() {
                        Task {
                            if await viewModel.signIn() {
                                viewModel.showMainView.toggle()
                            } else {
                                viewModel.isValid = false
                            }
                        }
                    } label: {
                        GradientButton(text: "Zaloguj się")
                            .frame(width: 250, height: 60)
                    }
                    .padding(.bottom, 10)
                    .fullScreenCover(isPresented: $viewModel.showMainView) {
                        MainView()
                    }
                    
                    HStack(spacing: 5) {
                        Text("Nie masz konta?")
                            .font(.custom("Montserrat", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Button() {
                            viewModel.showRegisterView.toggle()
                        } label: {
                            Text("Zarejestruj się")
                                .font(.custom("Montserrat", size: 16))
                                .fontWeight(.semibold)
                                .foregroundColor(.orangeColor())
                        }
                        .fullScreenCover(isPresented: $viewModel.showRegisterView) {
                            RegisterView()
                        }
                    }
                }
                .padding(.bottom, 60)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct TextFieldView: View {
    var title: String
    @Binding var holdText: String
    
    var body: some View {
        TextField(title, text: $holdText)
            .textFieldStyle()
    }
}

struct SecureFieldView: View {
    var title: String
    @Binding var holdText: String
    
    var body: some View {
        SecureField(title, text: $holdText)
            .textFieldStyle()
    }
}

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .font(.custom("Montserrat", size: 12))
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(Color.backgroundBoxColor())
            .cornerRadius(20)
            .foregroundColor(.white)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

extension View {
    func textFieldStyle() -> some View {
        modifier(TextFieldModifier())
    }
}

struct EyeButton: View {
    var image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 25, height: 25)
            .padding(.trailing, 15)
    }
}

struct backgroundColorView: View {
    var body: some View {
        Color.backgroundColor()
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}

struct LimboLogoView: View {
    var body: some View {
        HStack {
            Image("flame")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            
            Text("Limbo")
                .font(.custom("Montserrat", size: 40))
                .fontWeight(.semibold)
                .foregroundColor(.orangeColor())
        }
        .padding(.top, 35)
    }
}

struct LoginSecureFieldViewWithEyeIcon: View {
    var localViewModel: LoginViewModel
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

struct TextFieldViewWithUserIcon: View {
    @Binding var email: String
    
    var body: some View {
        ZStack(alignment: .trailing) {
            TextFieldView(title: "Email użytkownika", holdText: $email)
                .textContentType(.emailAddress)
                
            Image("userIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .padding(.trailing, 15)
        }
    }
}
