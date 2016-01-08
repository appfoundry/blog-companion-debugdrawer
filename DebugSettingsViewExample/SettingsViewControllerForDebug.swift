//
//  SettingsViewControllerForDebug.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 18/11/15.
//  Copyright © 2015 AppFoundry. All rights reserved.
//

import UIKit
import Eureka

class SettingsViewControllerForDebug: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
        let button = UIButton(type: .RoundedRect)
        button.tintColor = UIColor.orangeColor()
        button.setTitle("Debug", forState: .Normal)
        button.addTarget(self, action: "buttonTapped:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view .addConstraints([NSLayoutConstraint(item: button, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0), NSLayoutConstraint(item: button, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0)])
        
    }
    
    override func viewDidAppear(animated: Bool) {
        if let window = self.view.window {
            self.view.frame = window.bounds
        }
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = self.view.bounds.size.width / 2
    }
    
    func buttonTapped(button:UIButton) {
        // Hide the debug window
        self.view.window?.hidden = true
        
        //Present the form controller on the 'top' presented view controller of the app
        let controller = FormViewController()
        controller.form = Form()
            +++ self.stringManipulationSection()
            +++ (self.applicationInfoSection() ?? Section("No application info available!"))
        let item = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: "close")
        controller.navigationItem.rightBarButtonItem = item
        controller.title = "Debug Settings and Info"
        let nc = UINavigationController(rootViewController: controller)
        self.topPresentedViewController()?.presentViewController(nc, animated: true) {}
    }
    
    func close() {
        self.view.window?.hidden = false
        self.topPresentedViewController()?.dismissViewControllerAnimated(true) {}
    }
    
    private func stringManipulationSection() -> Section {
        return Section("StringService Selection") <<< SwitchRow() {
            $0.title = "Use the production service"
            $0.value = NSUserDefaults.standardUserDefaults().useDefault
        }.onChange() {
            NSUserDefaults.standardUserDefaults().useDefault = $0.value ?? false
        }
            <<< TextRow() {
                $0.title = "Custom message"
                $0.value = NSUserDefaults.standardUserDefaults().customDebugMessage
        }.onChange() {
            NSUserDefaults.standardUserDefaults().customDebugMessage = $0.value.flatMap { $0.isEmpty ? nil : $0 } ?? "Hello Void"
        }
    }
    
    private func applicationInfoSection() -> Section? {
        return NSBundle.mainBundle().infoDictionary.map({ (appInfo) -> Section in
            return Section("Application info")
                <<< LabelRow() {
                    $0.title = "Version"
                    $0.value = appInfo["CFBundleShortVersionString"] as? String
                }
                <<< LabelRow() {
                    $0.title = "Build"
                    $0.value = appInfo["CFBundleVersion"] as? String
                }
        })
    }
    
    private func topPresentedViewController() -> UIViewController? {
        return UIApplication.sharedApplication().keyWindow.flatMap({ (window) -> UIViewController? in
            return window.rootViewController.map({ (vc) -> UIViewController in
                var found = vc
                while found.presentedViewController != nil {
                    found = found.presentedViewController!
                }
                return found
            })
        })
    }
}