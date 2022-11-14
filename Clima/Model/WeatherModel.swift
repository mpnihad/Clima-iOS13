//
//  WeatherModel.swift
//  Clima
//
//  Created by Nihad-Mac on 14/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

struct WeatherModel
{
    var cityName: String
    var temperature : String
    var weatherID : Int
    var weatherIcon : UIImage{
        var imageName = ""
        switch weatherID {
        case 200...232:
            imageName = "cloud.moon.bolt"
        case 300...321:
            imageName = "cloud.drizzle"
        case 500...531:
            imageName = "cloud.rain"
        case 600...622:
            imageName = "cloud.snow"
        case 701:
            imageName = "humidity"
        case 711:
            imageName = "smoke"
        case 721:
            imageName = "sun.haze"
        case 731:
            imageName = "sun.dust"
        case 741:
            imageName = "cloud.fog"
        case 751:
            imageName = "sun.dust"
        case 761:
            imageName = "sun.dust"
        case 762:
            imageName = "sun.dust"
        case 771:
            imageName = "tropicalstorm"
        case 781:
            imageName = "tornado"
        case 800:
            imageName = "cloud"
        case 801...804:
            imageName = "cloud.sun"
        default:
            imageName = "exclamationmark.triangle.fill"
        }
        return UIImage(systemName: imageName)!
    }
    
    init(cityName: String, temperature: String, weatherID: Int ) {
        self.cityName = cityName
        self.temperature = temperature
        self.weatherID = weatherID
    }
    
 
}
