//
//  ViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 16.04.2023.
//

import UIKit
import CoreLocation
import MapKit



class ViewController: UIViewController, CLLocationManagerDelegate {


    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var labelOutlet: UILabel!
    
    let names = ["1", "2", "3", "4", "5"]
    
    
    var timeManager = TimeManager()
    var locationManager = CLLocationManager()
    var fiveTimeCollectionCopy:[String] = []
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        tableViewOutlet.isScrollEnabled = false
        timeManager.delegate = self
        tableViewOutlet.layer.cornerRadius = 10
        
        labelOutlet.text = "\(timeManager.dateFormatterText)\n\(timeManager.dateFormatterLast)"
        
        labelOutlet.font = UIFont.boldSystemFont(ofSize: 15)
        labelOutlet.textColor = .white
        
       
        
        
        
        
        
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            timeManager.getTempCityName(crData:timeManager.dateFormatter, c1: lat, c2: lon)
            print(lat)
            print(lon)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get users location.")
        print(error)
    }
   
    
    


    
}

extension ViewController:  TimeManagerDelegate, UITableViewDelegate, UITableViewDataSource{
    

    func didUpdateTime(_ timeManager: TimeManager, prayer: Prayer) {
//        print(prayer.getfiveTimeCollection)
        DispatchQueue.main.async {
            
            self.fiveTimeCollectionCopy = prayer.getfiveTimeCollection
            self.tableViewOutlet.reloadData()
           
            
        }
    }
    
    func errHandlingWeather(error: Error) {
        print(error)
    }
    
    
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fiveTimeCollectionCopy.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let prayerTime = fiveTimeCollectionCopy[indexPath.row]
        cell.textLabel?.text = prayerTime
        cell.textLabel?.font = UIFont(name: "Helvetica-Regular", size: 17)
        
        return cell
    }
    
}





//extension ViewController: UITableViewDelegate, UITableViewDataSource{
//
//
//
//
//
//
//}



