//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation


class WeatherViewController: UIViewController {
    
    @IBOutlet weak var searchTextField : UITextField!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
    var weatherManager = WeatherManager()
    
    let locationManagers = CoreLocation.CLLocationManager()
    
    @IBAction func currentLocationButton(_ sender: UIButton) {

        
            locationManagers.requestLocation()

    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        print(searchTextField.text ?? "")
        
        searchTextField.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        locationManagers.delegate = self
        
        locationManagers.requestWhenInUseAuthorization()
        locationManagers.requestLocation()
        
        
       
    }
    
    
    func populateUI(){
        
//        locationManager.
    
        
    }
    
    
}


//MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text ?? "")
        searchTextField.endEditing(true)
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text == "" || textField.text == nil {
            return false
        }
        
        else
        {
            textField.placeholder = "Type Something"
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let city = searchTextField.text{
            weatherManager.featchWeather(cityName: city)
            populateUI()
        }
        
        
        searchTextField.text = ""
        
    }
    
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(weatherModel: WeatherModel) {
        
        
        DispatchQueue.main.async {
            
            self.conditionImageView.image = weatherModel.weatherIcon
            
            self.temperatureLabel.text = weatherModel.temperature
            
            self.cityLabel.text = weatherModel.cityName
        }
    }
    
    func didErrorOccured(error: String) {
        
    }
}

//MARK: - LocationManager
extension WeatherViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("updated")
        if let location = locations.last{
            locationManagers.stopUpdatingLocation()
           let lat = String(location.coordinate.latitude)
           let lon =  String(location.coordinate.longitude)
            
            weatherManager.featchWeather(lat: lat, lon: lon)
            print("Latitude \(lat) longitude \(lon)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
}
