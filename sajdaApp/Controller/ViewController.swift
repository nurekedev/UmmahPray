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
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    let names = ["Fajr", "Sunrise", "Dhuhr", "Asr", "Magrib", "Isha"]
    
    
    var timeManager = TimeManager()
    var locationManager = CLLocationManager()
    var fiveTimeCollectionCopy:[String] = []
    var currentLocation: String?
    
    
    @IBOutlet weak var hijraTapped: UIButton!
    
    var isActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        tableViewOutlet.isScrollEnabled = false
        timeManager.delegate = self
        tableViewOutlet.layer.cornerRadius = 10
        
        labelOutlet.text = "\(timeManager.dateFormatterText)\n\(timeManager.dateFormatterLast)"
        
        labelOutlet.font = UIFont.boldSystemFont(ofSize: 20)
        labelOutlet.textColor = .white
        
        DispatchQueue.main.async {
            
            
            self.timeLabel.text = "\(self.timeManager.dateFormatterHours)"
            
        }
        
        
        
    }
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            timeManager.getTempCityName(crData:timeManager.dateFormatter, c1: lat, c2: lon)
    
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get users location.")
        print(error)
    }
   
    
    @IBAction func hijraCalendarTapped(_ sender: Any) {
        
        isActive = !isActive
        
        if isActive{
            labelOutlet.text = "\(timeManager.dateFormatterText)\n\(timeManager.hijraFormatterText)"
        }else{
            labelOutlet.text = "\(timeManager.dateFormatterText)\n\(timeManager.dateFormatterLast)"
            
        }
  
        
    
    }
 
    
    @IBAction func getLocationByAPI(_ sender: Any) {
        locationManager.requestLocation()
    }
    
    
}

extension ViewController:  TimeManagerDelegate, UITableViewDelegate, UITableViewDataSource{
    
    func didUpdateTime(_ timeManager: TimeManager, prayer: Prayer) {
        DispatchQueue.main.async {
            self.fiveTimeCollectionCopy = prayer.getfiveTimeCollection
            self.currentLocation = prayer.location
            self.locationLabel.text = self.currentLocation
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TimeViewCell
        let prayerTime = self.fiveTimeCollectionCopy
        
        
        
        
        
        cell.prayerName?.text = names[indexPath.row]
        cell.prayerTime?.text = prayerTime[indexPath.row]
        cell.prayerTime?.font = UIFont.boldSystemFont(ofSize: 19)
        cell.prayerName?.font = UIFont(name: "Arial", size: 17)
        
    
     

        DispatchQueue.main.async { [self] in
            
            if indexPath.row == timeManager.currentTableTime(fiveTime: self.fiveTimeCollectionCopy){
                print(timeManager.currentTableTime(fiveTime: self.fiveTimeCollectionCopy))
                cell.prayerTime.textColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
                cell.prayerName.textColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
                
            }
            
        }
       
        
        
        return cell
    }
    
 
    
    
    
}




