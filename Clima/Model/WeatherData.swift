//
//  WeatherData.swift
//  Clima
//
//  Created by Nihad-Mac on 14/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    let name : String
    
    let main : Main
    let weather : [Weather]
}

struct Main :Codable {
    let temp : Float
}

struct Weather :Codable {
    let description : String
    let id :Int
}
