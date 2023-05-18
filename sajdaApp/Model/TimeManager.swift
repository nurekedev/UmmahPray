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
    
    var dateFormatterHours: String{
        
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate.capitalized
    }
    
    var hijraWeekDayFormatterText: String{
        
        let currentDate = Date()
        let calendar = Calendar(identifier: .islamicCivil)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = "EEEE"
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate.capitalized
    }
    
    var hijraFormatterText: String{
        
        let currentDate = Date()
        let calendar = Calendar(identifier: .islamicCivil)
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.dateFormat = "d MMMM, yyyy"
        let formattedDate = dateFormatter.string(from: currentDate)
        return formattedDate
        
    }
    
   
   
    let apiUrl1 = "http://api.aladhan.com/v1/timings/"

    
    func getTempCityName(crData: String, c1: CLLocationDegrees, c2: CLLocationDegrees){
        let initialUrl = ("\(apiUrl1)\(crData)?latitude=\(c1)&longitude=\(c2)&method=2")
        performUrl(with: initialUrl)
      
    }
    var delegate: TimeManagerDelegate?

    func performUrl(with urlString:String){



        if let url = URL(string: urlString){


            let session = URLSession(configuration: .default)

 
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

            task.resume()

        }
    }



    // Creating function to JSON Decoder
    func jsonDecoder(decodedData: Data)->Prayer?{
        let decoder = JSONDecoder()
        do{
            let decodedLast = try decoder.decode(PrayerModel.self, from: decodedData)
            
            let fajr = decodedLast.data.timings.Fajr
            let sunrise = decodedLast.data.timings.Sunrise
            let dhuhr = decodedLast.data.timings.Dhuhr
            let asr = decodedLast.data.timings.Asr
            let maghrib = decodedLast.data.timings.Maghrib
            let isha = decodedLast.data.timings.Isha
            
            let location = decodedLast.data.meta.timezone
    

            let fiveTime = [fajr, sunrise, dhuhr, asr, maghrib, isha]
            let lplace = location
            
            
         
            

            let prayerM = Prayer(timeCollection: fiveTime, location: lplace)
            return prayerM
            
            
        }
        catch{
            delegate?.errHandlingWeather(error: error)
            return nil
        }


    }
    
   



    
    
    func currentTableTime(fiveTime:[String])->Int{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let currentTimeString = dateFormatter.string(from: Date())
   
        
        
        switch currentTimeString{
        case fiveTime[0]..<fiveTime[1]:
            return 0
        case fiveTime[1]..<fiveTime[2]:
            return 1
        case fiveTime[2]..<fiveTime[3]:
            return 2
        case fiveTime[3]..<fiveTime[4]:
            return 3
        case fiveTime[4]..<fiveTime[5]:
            return 4
        default:
            return 5
        }
        
    }
       

}
