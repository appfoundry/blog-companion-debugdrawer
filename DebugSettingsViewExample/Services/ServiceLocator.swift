//
//  ServiceLocator.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

class ServiceLocator {
    
    
    private let productionService = ProductionStringService()
    private var debugService:StringService?
    
    var stringService:StringService {
        get {
            if NSBundle.mainBundle().isDebug {
                debugService = debugService ?? StringServiceForDebug()
                if (NSUserDefaults.standardUserDefaults().useDefault) {
                    return productionService
                } else {
                    return debugService!
                }
            } else {
                return productionService
            }
        }
    }
    
    private var debugWindow: UIWindow? = {
        if NSBundle.mainBundle().isDebug {
            // Get the frame of our screen
            let frame = UIScreen.mainScreen().bounds
            
            // Create a new debug window, and position it at the top right of our screen
            // (make sure to keep a reference to the window, it will be removed from memory otherwise!)
            let debugWindow = WindowForDebug(frame: CGRect(x: CGRectGetWidth(frame) - 75.0, y: 0, width: 75, height: 75))
            
            // Make the window appear
            debugWindow.hidden = false
            
            // Assign a root view controller to the window
            let settingsVC = SettingsViewControllerForDebug()
            debugWindow.rootViewController = settingsVC
            
            return debugWindow
        } else {
            return nil
        }
    }()
}