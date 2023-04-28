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
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 65, height: 65)
                            }
                        }
                    }
                    .frame(maxHeight: 65)
                }
                    
                
                Spacer()
                
                }
            }
            
            
            
        }
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
