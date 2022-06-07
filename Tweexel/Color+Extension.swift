//
//  Color+Extension.swift
//  Tweexel
//
//  Created by Emanuel on 08.06.22.
//

import SwiftUI

enum TweexelColor {
    case red
    case blue
    case green
    case brown
    case orange
    case yellow
    case purple
    case gray
    case black

    var description: String {
        switch self {
        case .red:
            return "Red"
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        case .brown:
            return "Brown"
        case .orange:
            return "Orange"
        case .yellow:
            return "Yellow"
        case .purple:
            return "Purple"
        case .gray:
            return "Gray"
        case .black:
            return "Black"
        }
    }
}

extension Color {
    static func tweexel(_ color: TweexelColor) -> Color {
        return Color(color.description)
    }
}
