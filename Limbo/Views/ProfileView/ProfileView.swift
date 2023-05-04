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
                
                Text("Maciej Kowalski")
                    .font(.custom("Montserrat", size: 20))
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color("backgroundBoxColor"))
                        .frame(width: 230, height: 45)
                    
                    HStack(spacing: 25) {
                        Image("envelopeIconGradient")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                        
                        Text("maciejk@gmail.com")
                            .font(.custom("Montserrat", size: 12))
                            .fontWeight(.light)
                            .foregroundColor(.white)
                    }
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
