//
//  WeatherListTableViewController.swift
//  WeatherUsingVoice
//
//  Created by AppsGenii on 8/10/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate {
    
    private var weatherListViewModel = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        print(vm.name)
        self.weatherListViewModel.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddCities" {
            guard let nav = segue.destination as? UINavigationController else {
                fatalError("Navigation Controller not found")
            }
            
            guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
                
                fatalError("AddCitiesViewController not found")
            }
            addWeatherCityVC.delegate = self
        }
    }
}


extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        cell.cityNameLabel.text = weatherVM.name
        cell.temperatureLabel.text = "\(weatherVM.currentTemperature.temperature_min.formatAsDegree) -\(weatherVM.currentTemperature.temperature_max.formatAsDegree)"
        cell.windSpeedLabel.text = "Wind Speed: \(weatherVM.wind.speed)"
        cell.descriptionLabel.text = weatherVM.weather[0].description
        
        return cell
    }
}
