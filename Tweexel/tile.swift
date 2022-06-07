//
//  tile.swift
//  Tweexel
//
//  Created by Emanuel on 09.06.22.
//

import Foundation

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
}

