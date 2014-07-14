//
//  TVTVGuideContainerViewController.swift
//  tvdags3
//
//  Created by Henrik Wrangel on 2014-07-08.
//  Copyright (c) 2014 TVdagsse AB. All rights reserved.
//

import UIKit

class TVTVGuideContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _setupView()
    }
    
    //MARK: Private
    func _setupView() {
        TVEPGManager.sharedInstance.getShortList("2014-07-08", channels: "1", count: 3)
    }
}
