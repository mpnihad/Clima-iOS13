//
//  WeatherManager.swift
//  Clima
//
//  Created by Nihad-Mac on 13/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import UIKit

struct WeatherManager {
    
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIKey)&units=metric"
    
    
    var weatherIcon : UIImage? = nil
    var temp : String = ""
    var city : String = ""
    
    var delegate : WeatherManagerDelegate?
    //    var des : UIImage
    func featchWeather(cityName : String)   {
        
        let urlString  =  "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest( urlString)
        
    }
    
    func featchWeather(lat : String,lon : String)   {
        
        let urlString  =  "\(weatherURL)&lat=\(lat)&lon=\(lon)"
        print(urlString)
        performRequest( urlString)
        
    }
    
    func performRequest(_ urlString:String) {
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error)  in
                
                if error != nil {
                    self.delegate?.didErrorOccured(error: error!.localizedDescription)
                    return
                }
                
                if let safedata = data {
                    if let weather = parseJSON(safedata){
                        delegate?.didUpdateWeather(weatherModel: weather)
                    }
                }
                return
                
            }
            task.resume()
        }
        
        
    }
    
    func parseJSON(_ weatherData : Data) -> WeatherModel? {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let city = decodedData.name
            let weatherID = decodedData.weather[0].id
            let temp = String(format: "%.1f", decodedData.main.temp)
            let weatherModel = WeatherModel(cityName: city, temperature: temp, weatherID: weatherID)
            
            return weatherModel
            
        }
        catch {
            self.delegate?.didErrorOccured(error: error.localizedDescription)
            //            print(error)
            return nil
        }
    }
    
    
    
    
}
