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
                        TextFieldView(title: "Email użytkownika", holdText: $email)
                        
                        TextFieldView(title: "Hasło", holdText: $password)
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
            .font(.custom("Montserrat", size: 15))
            .fontWeight(.light)
            .frame(width: 250, height: 50)
            .background(Color("backgroundBoxColor"))
            .cornerRadius(20)
    }
}
