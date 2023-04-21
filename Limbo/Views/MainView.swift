//
//  ContentView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 20/04/2023.
//

import SwiftUI

struct MainView: View {
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
                        print("Tapped gradient button")
                    } label: {
                        GradientButton(text: "Zaloguj się")
                            .frame(width: 250, height: 60)
                    }
                    
                    Button() {
                        print("Tapped dark button")
                    } label: {
                        DarkButton()
                            .frame(width: 250, height: 60)
                            .background(Color("backgroundColor"))
                            .cornerRadius(25)
                    }
                }
                .padding(.bottom, 90)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
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
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
    }
}
