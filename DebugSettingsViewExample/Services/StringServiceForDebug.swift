//
//  StringServiceForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

class StringServiceForDebug : StringService {
    
    var customDebugMessage:String {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("debug.stringService.custom") as? String ?? "Hello Debugger"
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey:"debug.stringService.custom")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
    var useDefault:Bool{
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("debug.stringService.useDefault") as? Bool ?? true
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey:"debug.stringService.useDefault")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }

    let defaultStringService:StringService
    
    init(defaultStringService:StringService) {
        self.defaultStringService = defaultStringService
    }
    
    func greeting() -> String {
        if (useDefault) {
            return defaultStringService.greeting()
        } else {
            return customDebugMessage
        }
    }
}