//
//  UIColor.swift
//  Employee Directory
//
//  Created by Ryan David Forsyth on 2020-06-15.
//  Copyright © 2020 Ryan David Forsyth. All rights reserved.
//

import UIKit
import SwiftUI

extension UIColor {
    
    static func color(withR R:CGFloat, G:CGFloat, B:CGFloat, A:CGFloat) -> UIColor {
        return UIColor(red: (R/255.0), green: (G/255.0), blue: (B/255), alpha: A)
    }
    
    static func squareBlue() -> UIColor { // Color taken from squareup.com 🧑‍🎨
        return .color(withR: 82.0, G: 152.0, B: 201.0, A: 1.0)
    }
}

extension Color {
    
    static func squareBlue() -> Color {
        return Color(UIColor.squareBlue())
    }
}
