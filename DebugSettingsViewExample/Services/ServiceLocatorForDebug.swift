//
//  ServiceLocatorForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 08/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import UIKit
import Foundation

class ServiceLocatorForDebug : ServiceLocator {
    
    private let productionServiceLocator:ServiceLocator
    private let debugWindow: UIWindow
    var stringService:StringService
    
    init(productionServiceLocator:ServiceLocator) {
        self.productionServiceLocator = productionServiceLocator
        
        // Get the frame of our screen
        let frame = UIScreen.mainScreen().bounds
        
        // Create a new debug window, and position it at the top right of our screen
        // (make sure to keep a reference to the window, it will be removed from memory otherwise!)
        self.debugWindow = WindowForDebug(frame: CGRect(x: CGRectGetWidth(frame) - 75.0, y: 0, width: 75, height: 75))
        
        // Make the window appear
        debugWindow.hidden = false
        
        // Assign a root view controller to the window
        let settingsVC = SettingsViewControllerForDebug()
        debugWindow.rootViewController = settingsVC
        
        self.stringService = StringServiceForDebug(productionStringService: productionServiceLocator.stringService)
    }
    
    
}