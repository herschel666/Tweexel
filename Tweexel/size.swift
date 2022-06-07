//
//  size.swift
//  Tweexel
//
//  Created by Emanuel on 09.06.22.
//

import Foundation

struct Size: Identifiable, Equatable, Hashable {
    var id = UUID()
    var height: Int
    var width: Int

    public var name: String {
        "\(width)×\(height)"
    }

    init(_ height: Int, _ width: Int) {
        self.height = height
        self.width = width
    }
}
