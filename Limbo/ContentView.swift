//
//  ContentView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 20/04/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack() {
            Image("backgroundFlames")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack() {
                VStack {
                    Text("Limbo")
                        .font(.custom("Montserrat", size: 100))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        
                    VStack {
                        Text("Nauka programowania w C \n Aplikacja e-learningowa \n Politechniki Łódzkiej")
                            .font(.custom("Montserrat", size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.trailing)
                    }
                } .padding(.top, 70)
                
                
                Spacer()
                
                VStack {
                    Button() {
                        print("Tapped gradient button")
                    } label: {
                        ZStack {
                            LinearGradient(colors: [Color("redGradientColor"),Color("yellowGradientColor")], startPoint: .leading, endPoint: .trailing)
                            
                            Text("Zaloguj się")
                                .font(.custom("Montserrat", size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                    }
                    .cornerRadius(25)
                    .frame(width: 250, height: 60)
                    
                    Button() {
                        print("Tapped darker button")
                    } label: {
                        Text("Załóż konto")
                            .font(.custom("Montserrat", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .frame(width: 250, height: 60)
                    .background(Color("backgroundColor"))
                    .cornerRadius(25)
                }
                .padding(.bottom, 90)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
