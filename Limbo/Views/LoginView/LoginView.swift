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
                    }
                }
                .padding(.top, 50)
                    
                Spacer()
                
                VStack {
                    Button() {
                        print("Tapped gradient button")
                    } label: {
                        GradientButton(text: "Zaloguj się")
                            .frame(width: 250, height: 60)
                    }
                    .padding(.bottom, 10)
                    
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
                                .foregroundColor(Color("orangeColor"))
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
            .padding(15)
            .font(.custom("Montserrat", size: 12))
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(Color("backgroundBoxColor"))
            .cornerRadius(20)
            .foregroundColor(.white)
            .autocorrectionDisabled()
    }
}

struct SecureFieldView: View {
    var title: String
    @Binding var holdText: String
    
    var body: some View {
        SecureField(title, text: $holdText)
            .padding(15)
            .font(.custom("Montserrat", size: 12))
            .fontWeight(.semibold)
            .frame(width: 250, height: 50)
            .background(Color("backgroundBoxColor"))
            .cornerRadius(20)
            .foregroundColor(.white)
            .autocorrectionDisabled()
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
        Color("backgroundColor")
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
                .frame(width: 50, height: 50)
            
            Text("Limbo")
                .font(.custom("Montserrat", size: 50))
                .fontWeight(.semibold)
                .foregroundColor(Color("orangeColor"))
        }
        .padding(.top,50)
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
