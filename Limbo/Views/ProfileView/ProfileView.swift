//
//  ProfileView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 04/05/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            
            VStack(spacing: 15) {
                LimboLogoWithPointsView()
                
                VStack(spacing: 0) {
                    Image("exampleAvatar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    
                    Image("arrowsRotateIcon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 17, height: 17)
                        .padding(.leading, 85)
                }
                
                VStack {
                    Text("Maciej Kowalski")
                        .font(.custom("Montserrat", size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Text("maciejk@gmail.com")
                        .font(.custom("Montserrat", size: 12))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .tint(.white)
                }
                
                Text("Zmien hasło")
                    .font(.custom("Montserrat", size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(.white)

                VStack(spacing: 10) {
                    TextFieldView(title: "Stare hasło", holdText: $viewModel.oldPassword)
                    TextFieldView(title: "Nowe hasło", holdText: $viewModel.newPassword)
                    TextFieldView(title: "Powtórz nowe hasło", holdText: $viewModel.repeatNewPassword)
                }
                
                ChangePasswordButtonView()
                
                
                VStack {
                    Text("Wymień punkty na bonusy")
                        .font(.custom("Montserrat", size: 15))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                NavbarView(homeIcon: "homeIconWhite", quizIcon: "quizIconWhite", statsIcon: "statsIconWhite", profileIcon: "profileIconGradient")
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ChangePasswordButtonView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("redGradientColor"),Color("yellowGradientColor")], startPoint: .leading, endPoint: .trailing)
            
            Text("Zmień hasło")
                .font(.custom("Montserrat", size: 13))
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 130, height: 45)
        .cornerRadius(25)
        .padding(.top, 5)
    }
}
