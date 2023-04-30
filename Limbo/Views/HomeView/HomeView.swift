//
//  HomeView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 28/04/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            backgroundColorView()
            
            VStack {
                HStack(spacing: 20) {
                    ZStack {
                        Rectangle()
                            .frame(width: 65, height: 35)
                            .foregroundColor(Color("backgroundBoxColor"))
                            .cornerRadius(20)
                        HStack() {
                            Image("flame")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20, alignment: .leading)
                            Text("50")
                                .font(.custom("Montserrat", size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.top, 50)
                    
                        LimboLogoView()
                    
                        Image("exampleAvatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 35, height: 35)
                            .padding(.top, 50)
                    }
                    .padding(.top, 50)
                
                VStack(alignment: .leading) {
                    Text("Najlepsi w grupie")
                        .font(.custom("Montserrat", size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 25) {
                            ForEach(viewModel.imageList, id: \.self) { image in
                                ZStack {
                                    Image(image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 65, height: 65)
                                    
                                    ZStack() {
                                        Rectangle()
                                            .frame(width: 40, height: 25)
                                            .foregroundColor(Color("backgroundBoxColor"))
                                            .cornerRadius(20)
                                            .opacity(0.8)
                                        
                                        HStack(spacing: 3) {
                                            Image("flame")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 15, height: 15, alignment: .leading)
                                            Text("50")
                                                .font(.custom("Montserrat", size: 10))
                                                .fontWeight(.semibold)
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.leading, 30)
                                    .padding(.top, 45)
                                    
                                    
                                }
                            }
                        }
                    }
                    .frame(maxHeight: 65)
                }
                
                Spacer()
                
                NavbarView(homeIcon: "homeIconGradient", quizIcon: "quizIconWhite", statsIcon: "statsIconWhite", profileIcon: "profileIconWhite")
                    
                }
            }
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct NavbarView: View {
    var homeIcon: String
    var quizIcon: String
    var statsIcon: String
    var profileIcon: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("backgroundBoxColor"))
                .frame(width: UIScreen.main.bounds.width,
                       height: 70)
            HStack(spacing: 65) {
                Image(homeIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                Image(quizIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                Image(statsIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
                Image(profileIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            }
        }
    }
}
