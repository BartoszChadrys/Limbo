//
//  LoginView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 21/04/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
            VStack {
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
                
                Spacer()
                
                VStack {
                    Text("Logowanie")
                        .font(.custom("Montserrat", size: 40))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    VStack(spacing: 15) {
                        ZStack(alignment: .trailing) {
                            EmailTextFieldView(title: "Email użytkownika", holdText: $email)
                            
                            Image("userIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 15)
                        }
                        
                        ZStack(alignment: .trailing) {
                            SecureFieldView(title: "Hasło", holdText: $password)
                            
                            Image("passwordIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .padding(.trailing, 15)
                        }
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
                    
                    HStack {
                        Text("Nie masz konta?")
                            .font(.custom("Montserrat", size: 16))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Text("Zarejestruj się")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct EmailTextFieldView: View {
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
            .textContentType(.emailAddress)
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
