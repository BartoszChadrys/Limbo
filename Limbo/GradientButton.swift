//
//  GradientButton.swift
//  Limbo
//
//  Created by Bartek Chadryś on 20/04/2023.
//

import SwiftUI

struct GradientButton: View {
    var text: String
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("redGradientColor"),Color("yellowGradientColor")], startPoint: .leading, endPoint: .trailing)
            
            Text(text)
                .font(.custom("Montserrat", size: 20))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .cornerRadius(25)
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(text: "Zaloguj się")
            .frame(width: 250, height: 60)
    }
}
