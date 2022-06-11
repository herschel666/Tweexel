//
//  AppDelegate.swift
//  Tweexel
//
//  Created by Emanuel on 09.06.22.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var contentView: ContentView!
    var window: NSWindow!

    func applicationDidFinishLaunching(_ notification: Notification) {
        contentView = ContentView()
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 0, height: 0),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered,
            defer: false
        )
        window.center()
        window.setFrameAutosaveName("Tweexel")
        window.titlebarAppearsTransparent = true
        window.titleVisibility = .hidden
        window.backgroundColor = NSColor(Color.white)
        window.contentView = NSHostingView(rootView: contentView)
        window.makeKeyAndOrderFront(nil)
        window.standardWindowButton(.zoomButton)?.isHidden = true
        window.standardWindowButton(.miniaturizeButton)?.isEnabled = false
    }

    func applicationWillUpdate(_ notification: Notification) {
        if let menu = NSApplication.shared.mainMenu {
            let menuItems = menu.items.dropFirst(2)

            for item in menuItems {
                item.isHidden = true
            }
        }
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
}
