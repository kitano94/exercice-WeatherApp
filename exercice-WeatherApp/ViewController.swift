//
//  ViewController.swift
//  exercice-WeatherApp
//
//  Created by Mehdi Yembou on 08/12/2015.
//  Copyright © 2015 Mehdi Yembou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var mainTempLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    // MARK: Functions
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
            
}

