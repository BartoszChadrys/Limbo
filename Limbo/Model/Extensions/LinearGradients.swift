//
//  LinearGradients.swift
//  Limbo
//
//  Created by Bartek Chadryś on 11/05/2023.
//

import SwiftUI

extension LinearGradient {
    internal static func orangeGradient() -> LinearGradient {
        .init(colors: [Color("redGradientColor"),Color("yellowGradientColor")], startPoint: .leading, endPoint: .trailing)
    }
    
    internal static func greenGradient() -> LinearGradient {
        .init(colors: [Color("lightGreenColor"), Color("darkGreenColor")], startPoint: .leading, endPoint: .trailing)
    }
    
    internal static func redGradient() -> LinearGradient {
        .init(colors: [Color("lightRedColor"), Color("darkRedColor")], startPoint: .leading, endPoint: .trailing)
    }
    
    internal static func yellowGradient() -> LinearGradient {
        .init(colors: [Color("orangeColor"), Color("backgroundColor")], startPoint: .top, endPoint: .bottom)
    }
}
