//
//  MeteoDetails.swift
//  exercice-WeatherApp
//
//  Created by Mehdi Yembou on 10/12/2015.
//  Copyright © 2015 Mehdi Yembou. All rights reserved.
//

import Foundation
import Alamofire

class MeteoDetails {
    
    private var _tempDay1 : String!
    private var _tempDay2 : String!
    private var _tempDay3 : String!
    private var _tempDay4 : String!
    
    private var _iconDay1 : String!
    private var _iconDay2 : String!
    private var _iconDay3 : String!
    private var _iconDay4 : String!
    
    private var _meteoUrl : String!
    
    
    var tempDay1 : String {
        if _tempDay1 == nil {
            _tempDay1 = ""
        }
        return _tempDay1
    }
    
    var tempDay2: String {
        if _tempDay2 == nil {
            _tempDay2 = ""
        }
        return _tempDay2
    }
    
    var tempDay3: String {
        if _tempDay3 == nil {
            _tempDay3 = ""
        }
        return _tempDay3
    }
    
    var tempDay4: String {
        if _tempDay4 == nil {
            _tempDay4 = ""
        }
        return _tempDay4
    }
    
    var iconDay1 : String {
        if _iconDay1 == nil {
            _iconDay1 = ""
        }
        return _iconDay1
    }
    
    var iconDay2 : String {
        if _iconDay2 == nil {
            _iconDay2 = ""
        }
        return _iconDay2
    }
    
    var iconDay3 : String {
        if _iconDay3 == nil {
            _iconDay3 = ""
        }
        return _iconDay3
    }
    
    var iconDay4 : String {
        if _iconDay4 == nil {
            _iconDay4 = ""
        }
        return _iconDay4
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
                            self._tempDay1 = "\(temperature)"
                        }
                    }
                    
                    if let weather = list[0]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        
                        if let icon = weather[0]["icon"] as? String {
                            switch icon {
                                case "01d":
                                    self._iconDay1 = "" // wi-day-sunny
                                case "01n":
                                    self._iconDay1 = "" // wi-night-clear
                                case "02d":
                                    self._iconDay1 = "" // wi-day-cloudy
                                case "02n":
                                    self._iconDay1 = "" // wi-night-alt-cloudy
                                case "03d", "03n":
                                    self._iconDay1 = "" // wi-cloud
                                case "04d", "04n":
                                    self._iconDay1 = "" // wi-cloudy
                                case "09d", "09n":
                                    self._iconDay1 = "" // wi-rain-wind
                                case "10d":
                                    self._iconDay1 = "" // wi-day-rain
                                case "10n":
                                    self._iconDay1 = "" // wi-night-alt-rain
                                case "11d", "11n":
                                    self._iconDay1 = "" // wi-lightning
                                case "13d", "13n":
                                    self._iconDay1 = "" // wi-snow 
                                case "50d", "50n":
                                    self._iconDay1 = "" // wi-dust
                                
                                default:
                                    self._iconDay1 = "" // wi-na
                                
                            }
                        }
                        
                    }
                    
                    if let weather = list[1]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        
                        if let temp = list[0]["temp"] as? Dictionary<String, AnyObject> where temp.count > 0 {
                            if let temperature = temp["day"] as? Int {
                                self._tempDay2 = "\(temperature)"
                            }
                        }
                        
                        if let icon = weather[0]["icon"] as? String {
                            switch icon {
                            case "01d":
                                self._iconDay2 = "" // wi-day-sunny
                            case "01n":
                                self._iconDay2 = "" // wi-night-clear
                            case "02d":
                                self._iconDay2 = "" // wi-day-cloudy
                            case "02n":
                                self._iconDay2 = "" // wi-night-alt-cloudy
                            case "03d", "03n":
                                self._iconDay2 = "" // wi-cloud
                            case "04d", "04n":
                                self._iconDay2 = "" // wi-cloudy
                            case "09d", "09n":
                                self._iconDay2 = "" // wi-rain-wind
                            case "10d":
                                self._iconDay2 = "" // wi-day-rain
                            case "10n":
                                self._iconDay2 = "" // wi-night-alt-rain
                            case "11d", "11n":
                                self._iconDay2 = "" // wi-lightning
                            case "13d", "13n":
                                self._iconDay2 = "" // wi-snow
                            case "50d", "50n":
                                self._iconDay2 = "" // wi-dust
                                
                            default:
                                self._iconDay2 = "" // wi-na
                                
                            }
                        }
                        
                    }
                    
                    if let weather = list[2]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        
                        if let temp = list[0]["temp"] as? Dictionary<String, AnyObject> where temp.count > 0 {
                            if let temperature = temp["day"] as? Int {
                                self._tempDay3 = "\(temperature)"
                            }
                        }
                        
                        if let icon = weather[0]["icon"] as? String {
                            switch icon {
                            case "01d":
                                self._iconDay3 = "" // wi-day-sunny
                            case "01n":
                                self._iconDay3 = "" // wi-night-clear
                            case "02d":
                                self._iconDay3 = "" // wi-day-cloudy
                            case "02n":
                                self._iconDay3 = "" // wi-night-alt-cloudy
                            case "03d", "03n":
                                self._iconDay3 = "" // wi-cloud
                            case "04d", "04n":
                                self._iconDay3 = "" // wi-cloudy
                            case "09d", "09n":
                                self._iconDay3 = "" // wi-rain-wind
                            case "10d":
                                self._iconDay3 = "" // wi-day-rain
                            case "10n":
                                self._iconDay3 = "" // wi-night-alt-rain
                            case "11d", "11n":
                                self._iconDay3 = "" // wi-lightning
                            case "13d", "13n":
                                self._iconDay3 = "" // wi-snow
                            case "50d", "50n":
                                self._iconDay3 = "" // wi-dust
                                
                            default:
                                self._iconDay3 = "" // wi-na
                                
                            }
                        }
                        
                    }
                    
                    if let weather = list[3]["weather"] as? [Dictionary<String, AnyObject>] where weather.count > 0 {
                        
                        if let temp = list[0]["temp"] as? Dictionary<String, AnyObject> where temp.count > 0 {
                            if let temperature = temp["day"] as? Int {
                                self._tempDay4 = "\(temperature)"
                            }
                        }
                        
                        if let icon = weather[0]["icon"] as? String {
                            switch icon {
                            case "01d":
                                self._iconDay4 = "" // wi-day-sunny
                            case "01n":
                                self._iconDay4 = "" // wi-night-clear
                            case "02d":
                                self._iconDay4 = "" // wi-day-cloudy
                            case "02n":
                                self._iconDay4 = "" // wi-night-alt-cloudy
                            case "03d", "03n":
                                self._iconDay4 = "" // wi-cloud
                            case "04d", "04n":
                                self._iconDay4 = "" // wi-cloudy
                            case "09d", "09n":
                                self._iconDay4 = "" // wi-rain-wind
                            case "10d":
                                self._iconDay4 = "" // wi-day-rain
                            case "10n":
                                self._iconDay4 = "" // wi-night-alt-rain
                            case "11d", "11n":
                                self._iconDay4 = "" // wi-lightning
                            case "13d", "13n":
                                self._iconDay4 = "" // wi-snow
                            case "50d", "50n":
                                self._iconDay4 = "" // wi-dust
                                
                            default:
                                self._iconDay1 = "" // wi-na
                                
                            }
                        }
                        
                    }
                }
                
        }
        completed()
    }
    
}
}