//
//  StringServiceForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

class StringServiceForDebug : StringService {
    private let productionStringService:StringService
    
    init(productionStringService:StringService) {
        self.productionStringService = productionStringService
    }
    
    func greeting() -> String {
        if (NSUserDefaults.standardUserDefaults().useDefault) {
            return productionStringService.greeting()
        } else {
            return NSUserDefaults.standardUserDefaults().customDebugMessage
        }
    }
}