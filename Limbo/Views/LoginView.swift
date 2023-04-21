//
//  LoginView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 21/04/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    
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
                        TextField("Email użytkownika", text: $email)
                            .padding(15)
                            .font(.custom("Montserrat", size: 15))
                            .fontWeight(.light)
                            .frame(width: 250, height: 50)
                            .background(Color("backgroundBoxColor"))
                            .cornerRadius(20)
                        
                        TextField("Hasło", text: $email)
                            .padding(15)
                            .font(.custom("Montserrat", size: 15))
                            .fontWeight(.light)
                            .frame(width: 250, height: 50)
                            .background(Color("backgroundBoxColor"))
                            .cornerRadius(20)
                        }
                    }
                    
                Spacer()
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
