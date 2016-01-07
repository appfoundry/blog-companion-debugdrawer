//
//  ViewController.swift
//  DebugSettingsViewExample
//
//  Created by Michael Seghers on 18/11/15.
//  Copyright © 2015 AppFoundry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var generatedGreetingLabel: UILabel!
    var stringService:StringService? {
        get {
            return (UIApplication.sharedApplication().delegate as? AppDelegate)?.serviceLocator?.stringService
        }
    }
    
    @IBAction func generateGreeting() {
        generatedGreetingLabel.text = stringService?.greeting()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.generateGreeting()
        return true;
    }
}

