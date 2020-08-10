//
//  WeatherListTableViewController.swift
//  WeatherUsingVoice
//
//  Created by AppsGenii on 8/10/20.
//  Copyright © 2020 SaqibBhatti. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}


extension WeatherListTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.weatherListViewModel.numberOfRows(section)
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherTableViewCell
        
        //let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        
        //cell.configure(weatherVM)
        cell.temperatureLabel.text = "70°"
        
        return cell
    }
}
