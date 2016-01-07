//
//  NSUserDefaultsForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 07/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

extension NSUserDefaults {
    var customDebugMessage:String {
        get {
            return self.objectForKey("debug.stringService.custom") as? String ?? "Hello Debugger"
        }
        set {
            self.setObjectAndSynch(newValue, forKey:"debug.stringService.custom")
        }
    }
    var useDefault:Bool {
        get {
            return self.objectForKey("debug.stringService.useDefault") as? Bool ?? true
        }
        set {
            self.setObjectAndSynch(newValue, forKey:"debug.stringService.useDefault")
        }
    }
    
    private func setObjectAndSynch(object:AnyObject?, forKey key:String) {
        self.setObject(object, forKey:key)
        self.synchronize()
    }
}