//
//  NSBundleInfoExtension.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 07/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

extension NSBundle {
    var isDebug:Bool {
        get {
            return env.isEqual("DEBUG")
        }
    }
    
    var env:String {
        return NSBundle.mainBundle().infoDictionary?["AFBuildEnvironment"] as? String ?? "UNKNOWN"
    }
}