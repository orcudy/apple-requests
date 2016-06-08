//
//  ViewController.swift
//  demo
//
//  Created by CLICC User on 6/8/16.
//  Copyright © 2016 Apple Requests. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deviceTokenLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deviceTokenLabel.text = "Device token: \(TokenManager.sharedInstance.device)"
    }
}

