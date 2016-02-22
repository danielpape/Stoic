//
//  FirstViewController.swift
//  eve4
//
//  Created by Daniel Pape on 19/01/2016.
//  Copyright © 2016 Daniel Pape. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var toolbar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.hidden = true
        toolbar.barTintColor = UIColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapWakeButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 0
    }

    @IBAction func tapSleepButton(sender: AnyObject) {
         self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func tapSettingsButton(sender: AnyObject) {
        self.tabBarController?.selectedIndex = 2
    }
}

