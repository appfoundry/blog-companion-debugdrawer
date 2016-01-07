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
        self.backgroundColor = UIColor.clearColor()
        self.windowLevel = UIWindowLevelStatusBar + 100.0
        let settingsVC = SettingsViewControllerForDebug()
        self.rootViewController = settingsVC
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
