//
//  ServiceLocator.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 06/01/16.
//  Copyright © 2016 AppFoundry. All rights reserved.
//

import Foundation
import UIKit

protocol ServiceLocator {
    var stringService:StringService { get }
}

class ProductionServiceLocator : ServiceLocator {
    var stringService:StringService = ProductionStringService()
}