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
    @IBOutlet weak var pressureLbl: UILabel!
    
    
    var meteo = Meteo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meteo.downloadMeteoInfos { () -> () in
            self.updateUI()
            print(self.meteo.pressure)
        }
    }

    
    // MARK: Functions
    
    func updateUI() {
        pressureLbl.text = meteo.pressure
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

