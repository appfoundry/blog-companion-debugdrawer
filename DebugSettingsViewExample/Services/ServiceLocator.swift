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
    private var debugWindow: UIWindow?
    
    init() {
        let defaultStringService = ProductionStringService()
        #if DEBUG
            let frame = UIScreen.mainScreen().bounds
            self.debugWindow = WindowForDebug(frame: CGRect(x: CGRectGetWidth(frame) - 75.0, y: 0, width: 75, height: 75))
            self.debugWindow!.hidden = false

            
            stringService = StringServiceForDebug(defaultStringService:defaultStringService)
        #else
            stringService = defaultStringService
        #endif
    }
}