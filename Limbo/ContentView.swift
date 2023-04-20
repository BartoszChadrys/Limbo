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
                Text("Limbo")
                    .font(.custom("Montserrat", size: 90))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                VStack {
                    Text("Nauka programowania w C \n Aplikacja e-learningowa \n Politechniki Łódzkiej")
                        .font(.custom("Montserrat", size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.trailing)
                }
                
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
