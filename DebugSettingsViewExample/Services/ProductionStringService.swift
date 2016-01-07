//
//  DefaultStringService.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation

struct ProductionStringService : StringService {
    func greeting() -> String {
        return "Hello World"
    }
}