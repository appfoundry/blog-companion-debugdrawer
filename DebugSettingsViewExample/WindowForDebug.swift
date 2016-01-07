//
//  WindowForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 18/11/15.
//  Copyright © 2015 AppFoundry. All rights reserved.
//

import UIKit

class WindowForDebug: UIWindow {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Make the window transparent, so that it doesn't hide the actual applications content
        self.backgroundColor = UIColor.clearColor()
        
        // Make sure the 'z-position' of the window is above the application window and all other windows that might popup
        self.windowLevel = UIWindowLevelStatusBar + 100.0
        
        // Add a pan gesture recognizer, so we can move the debug window around
        let pan = UIPanGestureRecognizer(target: self, action: Selector("panned:"))
        self.addGestureRecognizer(pan)
    }
    
    func panned(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint(), inView: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
