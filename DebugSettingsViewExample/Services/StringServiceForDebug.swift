//
//  StringServiceForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

class StringServiceForDebug : StringService {
    func greeting() -> String {
        return NSUserDefaults.standardUserDefaults().customDebugMessage
    }
}