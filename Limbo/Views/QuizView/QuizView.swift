//
//  QuizView.swift
//  Limbo
//
//  Created by Bartek Chadryś on 01/06/2023.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack {
                LimboLogoWithPointsView()
                
                Spacer()
                
                
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
