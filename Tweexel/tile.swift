//
//  tile.swift
//  Tweexel
//
//  Created by Emanuel on 09.06.22.
//

import Foundation
import SwiftUI
import AppKit

struct Tile: Identifiable, Equatable {
    public static var dimension = 30

    var id = UUID()
    var color: TweexelColor
    var emoji: String

    init(_ color: TweexelColor? = nil) {
        self.color = color ?? .gray
        self.emoji = ""
    }

    static func getEmoji(color: TweexelColor) -> String {
        switch color {
        case .red:
            return "🟥"
        case .blue:
            return "🟦"
        case .green:
            return "🟩"
        case .brown:
            return "🟫"
        case .orange:
            return "🟧"
        case .yellow:
            return "🟨"
        case .purple:
            return "🟪"
        case .gray:
            return "⬜️"
        case .black:
            return "⬛️"
        }
    }

    public func toSVG() -> String {
        let components = NSColor(Color(color.description)).cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0
        let red = Int(round(r * 255))
        let green = Int(round(g * 255))
        let blue = Int(round(b * 255))
        let rgb = "rgb(\(red), \(green), \(blue))"

        return "<path fill='\(rgb)' d='M36 32c0 2.209-1.791 4-4 4H4c-2.209 0-4-1.791-4-4V4c0-2.209 1.791-4 4-4h28c2.209 0 4 1.791 4 4v28z' />"
    }
}

