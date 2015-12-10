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
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var speedLbl: UILabel!
    
    @IBOutlet weak var iconDay1Lbl: UILabel!
    @IBOutlet weak var iconDay2Lbl: UILabel!
    @IBOutlet weak var iconDay3Lbl: UILabel!
    @IBOutlet weak var iconDay4Lbl: UILabel!
    
    
    var meteo = Meteo()
    var meteoDetails = MeteoDetails()
    var weekArray = ["Lundi","Mardi","Mercredi","Jeudi","Vendredi","Samedi","Dimanche"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meteo.downloadMeteoInfos { () -> () in
            self.updateUI()
        }
        
        meteoDetails.downloadMeteoInfos { () -> () in
            self.updateUI()
        }
    }

    
    // MARK: Functions
    
    func updateUI() {
        mainTempLbl.text = meteo.temp
        pressureLbl.text = "\(meteo.pressure) hpa"
        humidityLbl.text = "\(meteo.humidity) %"
        speedLbl.text = "\(meteo.speed) m/s"
        
        iconDay1Lbl.text = meteoDetails.iconDay1
        iconDay2Lbl.text = meteoDetails.iconDay2
        iconDay3Lbl.text = meteoDetails.iconDay3
        iconDay4Lbl.text = meteoDetails.iconDay4
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
}

