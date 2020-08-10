//
//  WeatherListViewModel.swift
//  WeatherUsingVoice
//
//  Created by AppsGenii on 8/10/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
}

struct WeatherViewModel: Decodable {
    let name: String
    let currentTemperature: TemperatureViewModel
    let wind: WindViewModel
    let weather: [WeatherDescriptionViewModel]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
        case wind
        case weather
    }
}

struct TemperatureViewModel: Decodable {
    let temperature: Double
    let temperature_min: Double
    let temperature_max: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperature_min = "temp_min"
        case temperature_max = "temp_max"
    }
}

struct WindViewModel: Decodable {
    let speed: Double
}

struct WeatherDescriptionViewModel: Decodable {
    let description: String
}
