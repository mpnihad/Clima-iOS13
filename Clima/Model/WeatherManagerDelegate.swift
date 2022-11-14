//
//  WeatherProtocol.swift
//  Clima
//
//  Created by Nihad-Mac on 14/11/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weatherModel :  WeatherModel)
    
    func didErrorOccured(error: String)
}
