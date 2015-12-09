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
    
    var pressure: String {
        if _pressure == nil {
            _pressure = ""
        }
        return _pressure
    }
    
    init() {
        _meteoUrl = "\(URL_BASE)\(API_KEY)"
    }
    
    func downloadMeteoInfos(completed: DownloadComplete) {
        
        let url = NSURL(string: _meteoUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let pressure = dict["list"] as? [Dictionary<String, AnyObject>] {
                    if let press = pressure[0]["pressure"] as? Int {
                        self._pressure = "\(press)"
                        print(self.pressure)
                    }
                }
            }
           completed()
        }
    }
}