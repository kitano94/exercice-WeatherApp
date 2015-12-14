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
    
    @IBOutlet weak var day1NameLbl: UILabel!
    @IBOutlet weak var day2NameLbl: UILabel!
    @IBOutlet weak var day3NameLbl: UILabel!
    @IBOutlet weak var day4NameLbl: UILabel!
    
    
    @IBOutlet weak var dateLbl: UILabel!
    
    let currentDate = NSDate()
    let dateFormatter = NSDateFormatter()
    let todaydate = NSDateFormatter()
    
    var meteo = Meteo()
    var meteoDetails = MeteoDetails()
    var weekArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meteo.downloadMeteoInfos { () -> () in
            self.updateUI()
        }
        
        meteoDetails.downloadMeteoInfos { () -> () in
            self.updateUI()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        calculDay()
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
    
    func calculDay() {
        
        dateFormatter.locale = NSLocale(localeIdentifier: "fr_FR")
        dateFormatter.dateFormat = "EEE"
        todaydate.locale = NSLocale(localeIdentifier: "fr_FR")
        todaydate.dateFormat = "EEEE, dd MMMM, yyyy"
        let convertedDate = dateFormatter.stringFromDate(currentDate)
        let today = todaydate.stringFromDate(currentDate)
        dateLbl.text = today.capitalizedString
        
        switch convertedDate {
            case "lun.":
            weekArray = ["MAR","MER","JEU","VEN"]
            case "mar.":
            weekArray = ["MER","JEU","VEN","SAM"]
            case "mer.":
            weekArray = ["JEU","VEN","SAM","DIM"]
            case "jeu.":
            weekArray = ["VEN","SAM","DIM","LUN"]
            case "ven.":
            weekArray = ["SAM","DIM","LUN","MAR"]
            case "sam.":
            weekArray = ["DIM","LUN","MAR","MER"]
            case "dim.":
            weekArray = ["LUN","MAR","MER","JEU"]
            
        default:
            weekArray = ["LUN","MAR","MER","JEU"]
        }
        
        day1NameLbl.text = weekArray[0] as? String
        day2NameLbl.text = weekArray[1] as? String
        day3NameLbl.text = weekArray[2] as? String
        day4NameLbl.text = weekArray[3] as? String
        
    }
    
}

