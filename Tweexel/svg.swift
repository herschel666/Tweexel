//
//  svg.swift
//  Tweexel
//
//  Created by Emanuel on 12.06.22.
//

import Foundation

struct SVG {
    var width: Int
    var tiles: [Tile]

    private var height: Int {
        return tiles.count / width
    }
    private var prefix: String {
        let sizeX = size(width)
        let sizeY = size(height)

        return "<svg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 \(sizeX) \(sizeY)'>"
    }
    private var suffix = "</svg>"

    init(width: Int, _ tiles: [Tile]) {
        self.width = width
        self.tiles = tiles
    }

    private func size(_ tilesCount: Int) -> Int {
        return tilesCount * 36 + (tilesCount - 1) * 4
    }

    public func toString() -> String {
        var result = prefix + "\n"

        for i in tiles.indices {
            let row = i == 0 ? 0 : floor(Double(i) / Double(width))
            let col = i == 0 ? 0 : i % height
            let x = col * 36 + col * 4
            let y = Int(row * 36 + row * 4)

            result.append("\t<g transform='translate(\(x) \(y))'>\n")
            result.append("\t\t\(tiles[i].toSVG())\n")
            result.append("\t</g>\n")
        }

        result.append(suffix)

        return result
    }
}
