//
//  Colot_Theme.swift
//  08_Moonshot
//
//  Created by Laura on 12.09.2022..
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {      // only if we're extending Color
    static var darkBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    static var lightBackground: Color {
        Color(red: 0.2, green: 0.2, blue: 0.3)
    }
}
