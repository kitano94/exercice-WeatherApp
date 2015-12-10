//
//  Meteo.swift
//  exercice-WeatherApp
//
//  Created by Mehdi Yembou on 09/12/2015.
//  Copyright © 2015 Mehdi Yembou. All rights reserved.
//

import Foundation
import Alamofire

class Meteo {
    
    private var _temp: String!
    private var _pressure: String!
    private var _humidity:String!
    private var _speed: String!
    private var _meteoUrl: String!
    
    var temp: String {
        if _temp == nil {
            _temp = ""
        }
        return _temp
    }
    
    var pressure: String {
        if _pressure == nil {
            _pressure = ""
        }
        return _pressure
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = ""
        }
        return _humidity
    }
    
    var speed: String {
        if _speed == nil {
            _speed = ""
        }
        return _speed
    }
    
    init() {
        _meteoUrl = "\(URL_BASE)\(API_KEY)"
    }
    
    func downloadMeteoInfos(completed: DownloadComplete) {
        
        let url = NSURL(string: _meteoUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {

                if let list = dict["list"] as? [Dictionary<String, AnyObject>] where list.count > 0 {
                    
                    if let temp = list[0]["temp"] as? Dictionary<String, AnyObject> where temp.count > 0 {
                        if let temperature = temp["day"] as? Int {
                            self._temp = "\(temperature)"
                        }
                    }
                    
                    if let pressure = list[0]["pressure"] as? Int {
                        self._pressure = "\(pressure)"
                    }
                    
                    if let humidity = list[0]["humidity"] as? Int {
                        self._humidity = "\(humidity)"
                    }
                    
                    if let speed = list[0]["speed"] as? Int {
                        self._speed = "\(speed)"
                    }
                }
            }
           completed()
        }
    }
}