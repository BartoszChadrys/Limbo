//
//  Constants.swift
//  Limbo
//
//  Created by Bartek Chadryś on 03/05/2023.
//

import SwiftUI

struct K {
    static let navbarBottomPadding: CGFloat = 50.0
    static let topicsHomeViewPadding: CGFloat = 35.0
    static let alertWidth: CGFloat = 300.0
    static let pointsAlertHeight: CGFloat = 150.0
    static let squareAlertHeight: CGFloat = 180.0
    
    static let doneIcon: Image = Image("checkmarkIcon")
    static let doneColor: Color = .greenColor()
    static let doneGradient: LinearGradient = .greenGradient()
    
    static let progressIcon: Image = Image("flameWhite")
    static let progressColor: Color = .orangeColor()
    static let progressGradient: LinearGradient = .orangeGradient()
    
    static let lockIcon: Image = Image("lockIcon")
    static let lockColor: Color = .redColor()
    static let lockGradient: LinearGradient = .redGradient()
}
