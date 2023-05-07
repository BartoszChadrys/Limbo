//
//  ContentView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 20/04/2023.
//

import SwiftUI

struct FirstView: View {
    @State private var showLoginView = false
    @State private var showRegisterView = false
    
    var body: some View {
        ZStack() {
            backgroundImageView()
            VStack() {
                VStack(alignment: .trailing) {
                    Text("Limbo")
                        .font(.custom("Montserrat", size: 100))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        
                    Text("Nauka programowania w C \n Aplikacja e-learningowa \n Politechniki Łódzkiej")
                        .font(.custom("Montserrat", size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }
                .padding(.top, 70)
                
                Spacer()
                
                VStack() {
                    Button() {
                        showLoginView.toggle()
                    } label: {
                        GradientButton(text: "Zaloguj się")
                            .frame(width: 250, height: 60)
                    }
                    .fullScreenCover(isPresented: $showLoginView) {
                        LoginView()
                    }
                    
                    Button() {
                        showRegisterView.toggle()
                    } label: {
                        DarkButton()
                            .frame(width: 250, height: 60)
                            .background(Color("backgroundColor"))
                            .cornerRadius(25)
                    }
                    .fullScreenCover(isPresented: $showRegisterView) {
                        RegisterView()
                    }
                }
                .padding(.bottom, 90)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

struct DarkButton: View {
    var body: some View {
        Text("Załóż konto")
            .font(.custom("Montserrat", size: 16))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct backgroundImageView: View {
    var body: some View {
        Image("backgroundFlames")
            .resizable()
            .renderingMode(.original)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
    }
}
