//
//  ServiceLocator.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

struct ServiceLocator {
    
    let stringService:StringService
    private let debugWindow: UIWindow
    
    init() {
        let defaultStringService = ProductionStringService()
        #if DEBUG
            // Get the frame of our screen
            let frame = UIScreen.mainScreen().bounds
            
            // Create a new debug window, and position it at the top right of our screen
            // (make sure to keep a reference to the window, it will be removed from memory otherwise!)
            self.debugWindow = WindowForDebug(frame: CGRect(x: CGRectGetWidth(frame) - 75.0, y: 0, width: 75, height: 75))
            
            // Make the window appear
            self.debugWindow.hidden = false

            // Assign a root view controller to the window
            let settingsVC = SettingsViewControllerForDebug()
            debugWindow.rootViewController = settingsVC

            
            stringService = StringServiceForDebug(defaultStringService:defaultStringService)
        #else
            stringService = defaultStringService
        #endif
    }
}