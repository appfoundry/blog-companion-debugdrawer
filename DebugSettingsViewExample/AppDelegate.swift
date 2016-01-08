//
//  AppDelegate.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 18/11/15.
//  Copyright © 2015 AppFoundry. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var serviceLocator:ServiceLocator?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        #if DEBUG
        serviceLocator = ServiceLocatorForDebug()
        #else
        serviceLocator = ProductionServiceLocator()
        #endif
        return true
    }
}

