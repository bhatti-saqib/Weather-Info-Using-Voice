//
//  AddWeatherCityViewController.swift
//  WeatherUsingVoice
//
//  Created by AppsGenii on 8/10/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNamesTextField: UITextField!
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func closeBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
