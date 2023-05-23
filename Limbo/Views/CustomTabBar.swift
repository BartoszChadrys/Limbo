//
//  CustomNavbar.swift
//  Limbo
//
//  Created by Bartek Chadryś on 16/05/2023.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab: Tab
    
    var body: some View {
        VStack() {
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Button() {
                        withAnimation(.easeInOut) {
                            currentTab = tab
                        }
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, maxHeight: 20)
                            .foregroundColor(currentTab == tab ? .orangeColor() : .white)
                            .offset(y: currentTab == tab ? -10 : 0)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(height: 24)
        .padding(.top, 30)
        .padding(.bottom, 15)
        .background(Color.backgroundBoxColor())
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
