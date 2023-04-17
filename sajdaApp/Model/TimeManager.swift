//
//  TimeManager.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 16.04.2023.
//



import UIKit
import CoreLocation


//protocol WhetherManagerDelegate{
//    func didUpdateWeather(_ whetherManager: WhetherManager, weather: WeatherModel)
//    func errHandlingWeather(error: Error)
//}

protocol TimeManagerDelegate{
    func didUpdateTime(_ timeManager: TimeManager, prayer: Prayer)
    func errHandlingWeather(error: Error)
}


struct TimeManager{
    
    var dateFormatter: String{
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    var dateFormatterLast: String{
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM, yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate

        
    }
    var dateFormatterText: String{
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate.capitalized
    }
    
   
    // Creating api's URL
    let apiUrl1 = "http://api.aladhan.com/v1/timings/"

    
    func getTempCityName(crData: String, c1: CLLocationDegrees, c2: CLLocationDegrees){
        let initialUrl = ("\(apiUrl1)\(crData)?latitude=\(c1)&longitude=\(c2)&method=2")
        performUrl(with: initialUrl)
        print(apiUrl1)
    }
    var delegate: TimeManagerDelegate?

    func performUrl(with urlString:String){


        // Crating URL
        if let url = URL(string: urlString){

            // Creating SESSION
            let session = URLSession(configuration: .default)

            // creating a TASK
            let task = session.dataTask(with: url) { data, response, error in

            
                if error != nil{
                    self.delegate?.errHandlingWeather(error: error!)
                    return
                }

                if let safeDate = data{
                    if let prayerTimes = self.jsonDecoder(decodedData: safeDate){
                        self.delegate?.didUpdateTime(self, prayer: prayerTimes)
                      
                    }
                }

            }

            // Start a task
            task.resume()

        }
    }



    // Creating function to JSON Decoder
    func jsonDecoder(decodedData: Data)->Prayer?{
        let decoder = JSONDecoder()
        do{
            let decodedLast = try decoder.decode(PrayerModel.self, from: decodedData)
            
            let fajr = decodedLast.data.timings.Fajr
            let dhuhr = decodedLast.data.timings.Dhuhr
            let asr = decodedLast.data.timings.Asr
            let maghrib = decodedLast.data.timings.Maghrib
            let isha = decodedLast.data.timings.Isha

            let fiveTime = [fajr, dhuhr, asr, maghrib, isha]
            
            
         
            

            let prayerM = Prayer(timeCollection: fiveTime)
//            print(prayerM)
            return prayerM
            
            
        }
        catch{
            delegate?.errHandlingWeather(error: error)
            return nil
        }


    }
    

}
