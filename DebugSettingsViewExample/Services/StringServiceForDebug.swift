//
//  StringServiceForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

class StringServiceForDebug : StringService {
    
    let defaultStringService:StringService
    
    init(defaultStringService:StringService) {
        self.defaultStringService = defaultStringService
    }
    
    func greeting() -> String {
        if (NSUserDefaults.standardUserDefaults().useDefault) {
            return defaultStringService.greeting()
        } else {
            return NSUserDefaults.standardUserDefaults().customDebugMessage
        }
    }
}