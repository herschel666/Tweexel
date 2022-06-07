//
//  ContentView.swift
//  Tweexel
//
//  Created by Emanuel on 07.06.22.
//

import AppKit
import SwiftUI

struct ContentView: View {
    public static var defaultSize = Size(4, 4)
    public static let minWidth = 200.0
    public static let gap = 8.0

    @State private var tiles: [Tile] = ContentView.getTiles(columns: ContentView.defaultSize.width, rows: ContentView.defaultSize.height)
    @State private var grid: [GridItem] = ContentView.getGrid(columns: ContentView.defaultSize.width)
    @State private var currentColor = TweexelColor.red
    @State private var currentSize = ContentView.defaultSize

    private let colors: [TweexelColor] = [
        .red,
        .blue,
        .green,
        .brown,
        .orange,
        .yellow,
        .purple,
        .gray,
        .black,
    ]

    private let sizes: [Size] = [
        ContentView.defaultSize,
        Size(5, 5),
        Size(6, 6),
        Size(8, 6),
        Size(6, 8),
    ]

    var body: some View {
        let currentSizeBinding = Binding<Size>(
            get: { currentSize },
            set: { newSize in
                currentSize = newSize
                grid = ContentView.getGrid(columns: newSize.width)
                tiles = ContentView.getTiles(columns: newSize.width, rows: newSize.height)
            }
        )
        let frameWidth = max(getFrameSize(size: currentSize.width), ContentView.minWidth)

        return VStack {
            HStack {
                Picker("Choose a color…", selection: $currentColor) {
                    ForEach(colors, id: \.self) {
                        Text($0.description)
                    }
                }
                .labelsHidden()
                .padding()
                .accentColor(Color.tweexel(currentColor))

                Spacer()

                Picker("Choose a size…", selection: currentSizeBinding) {
                    ForEach(sizes, id: \.self) {
                        Text($0.name)
                    }
                }
                .labelsHidden()
                .padding()
            }

            LazyVGrid(columns: grid, alignment: .center, spacing: ContentView.gap) {
                ForEach(tiles) { tile in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.tweexel(tile.color))
                        .frame(width: CGFloat(Tile.dimension), height: CGFloat(Tile.dimension))
                        .onTapGesture {
                            setColor(tile)
                        }
                }
            }
            .padding()
            .frame(width: frameWidth, height: getFrameSize(size: currentSize.height))

            HStack {
                Button("Reset") {
                    resetTiles()
                }
                .padding()

                Spacer()

                Button("Copy") {
                    copyTiles()
                }
                .padding()
            }
        }
        .accentColor(Color.black)
        .background(Color.white)
    }

    public static func getGrid(columns: Int) -> [GridItem] {
        var newGrid = [GridItem]()
        newGrid.reserveCapacity(columns)

        for _ in 0..<columns {
            newGrid.append(GridItem(.fixed(CGFloat(Tile.dimension))))
        }

        return newGrid
    }

    public static func getTiles(columns: Int, rows: Int) -> [Tile] {
        var newTiles = [Tile]()
        let sum = columns * rows

        newTiles.reserveCapacity(sum)

        for _ in 0..<sum {
            newTiles.append(Tile())
        }

        return newTiles
    }

    func getFrameSize(size: Int) -> CGFloat {
        let accumulatedSpacing = (size + 1) * Int(ContentView.gap)
        let accumulatedTileSize = size * Tile.dimension

        return CGFloat(accumulatedSpacing + accumulatedTileSize)
    }

    func setColor(_ tile: Tile) -> Void {
        let index = tiles.firstIndex(of: tile)

        tiles[index!] = Tile(currentColor)
    }

    func resetTiles() {
        for i in 0..<tiles.count {
            tiles[i] = Tile()
        }
    }

    func copyTiles() {
        var result = ""

        for i in 0..<tiles.count {
            if i > 0 && i % currentSize.width == 0 {
                result.append("\n")
            }
            result.append(Tile.getEmoji(color: tiles[i].color))
        }

        NSPasteboard.general.declareTypes([.string], owner: nil)
        NSPasteboard.general.setString(result, forType: .string)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
