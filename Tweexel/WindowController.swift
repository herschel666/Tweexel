//
//  WindowController.swift
//  Tweexel
//
//  Created by Emanuel on 09.06.22.
//

import AppKit

class WindowController: NSWindowController {
    override func windowDidLoad() {
        super.windowDidLoad()

        window?.titlebarAppearsTransparent = true
        window?.backgroundColor = .white
    }
}
