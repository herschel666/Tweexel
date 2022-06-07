//
//  TweexelApp.swift
//  Tweexel
//
//  Created by Emanuel on 07.06.22.
//

import SwiftUI

@main
struct TweexelApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            appDelegate.contentView
        }
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.newItem) { }
            CommandGroup(replacing: .pasteboard) { }
            CommandGroup(replacing: .undoRedo) { }
        }
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

