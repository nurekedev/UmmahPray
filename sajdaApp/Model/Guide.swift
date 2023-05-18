//
//  Guide.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 28.04.2023.
//

import UIKit


struct Place{
    let title: String
    let address: String
    let abulation: Bool
    let womenSection: Bool
    let jumaStatus: Bool
    let capacity: Int
    let poster: UIImage
    let schedule: String
    let location: String
}


struct Event{
    let title: String
    let icon: UIImage
    let description: String
}

struct Group{
    let groups: [Group]?
    let name: String
    let places: [Place]?
    let titleImage: UIImage
}

class Guide{
    
    var groups = [Group]()
    var events = [Event]()
    
    init(){
        seedData()
    }
    
    func seedData(){
        
        // Mechet's
        let m1 = Place(title: "Taugul", address: "Паримбетова, 9a", abulation: true, womenSection: true, jumaStatus: true, capacity: 1500, poster: UIImage(named: "m1")!, schedule:("from 06:00 to 21:00"), location: "Таугул Алмаатинская область Қазақстан")
        
        let m2 = Place(title: "Baiken", address: "Розыбакиева, 200", abulation: true, womenSection: true, jumaStatus: true, capacity: 2200, poster: UIImage(named: "m2")!, schedule: "from 08:00 to 22:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m3 = Place(title: "Tole bi Mosque", address: "улица Толе Би, 233", abulation: true, womenSection: true, jumaStatus: true, capacity: 500, poster: UIImage(named: "m3")!, schedule: "from 07:00 to 22:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m4 = Place(title: "Umar ibn al-Khattab", address: "Жукова, 136", abulation: true, womenSection: true, jumaStatus: true, capacity: 1000, poster: UIImage(named: "m4")!, schedule: "from 06:00 to 23:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m5 = Place(title: "Al-Madina", address: "Федорова, 12", abulation: true, womenSection: true, jumaStatus: true, capacity: 2500, poster: UIImage(named: "m5")!, schedule: "from 06:30 to 23:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m6 = Place(title: "Almaty Central Mosque", address: "Розыбакиева, 200", abulation: true, womenSection: true, jumaStatus: true, capacity: 5000, poster: UIImage(named: "m6")!, schedule: "from 06:00 to 21:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m7 = Place(title: "Al-Hamid", address: "Омаровой, 7", abulation: true, womenSection: true, jumaStatus: true, capacity: 1500, poster: UIImage(named: "m7")!, schedule: "from 04:30 to 21:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m8 = Place(title: "Aksai", address: "Микрорайон Аксай-5, 6А", abulation: true, womenSection: true, jumaStatus: true, capacity: 2000, poster: UIImage(named: "m8")!, schedule: "from 06:00 to 21:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        let m9 = Place(title: "Nur", address: "Уйгурская, 16/1", abulation: true, womenSection: true, jumaStatus: true, capacity: 250, poster: UIImage(named: "m9")!, schedule: "from 07:00 to 23:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        
        // Namazhana's
           let n1 = Place(title: "Rodnoi Burger", address: "Розыбакиева, 15A", abulation: true, womenSection: true, jumaStatus: false, capacity: 50, poster: UIImage(named: "n1")!, schedule: "from 08:00 to 00:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
           
           let n2 = Place(title: "URBO Coffee", address: "ЖК Big Towers, 102", abulation: true, womenSection: true, jumaStatus: false, capacity: 5, poster: UIImage(named: "n2")!, schedule: "from 08:00 to 00:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
           let n3 = Place(title: "Zaitun", address: "Жандосова, 1/1", abulation: true, womenSection: true, jumaStatus: false, capacity: 4, poster: UIImage(named: "n3")!, schedule: "from 08:00 to 00:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
           let n4 = Place(title: "Zhekas Doner Family", address: "улица Сатпаева, 46", abulation: true, womenSection: true, jumaStatus: false, capacity: 5, poster: UIImage(named: "n4")!, schedule: "from 08:00 to 23:59", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
           let n5 = Place(title: "Dutar", address: "Ауэзова, 179, 2этаж", abulation: true, womenSection: true, jumaStatus: false, capacity: 8, poster: UIImage(named: "n5")!, schedule: "from 11:00 to 23:00", location: "Розыбакиев көш Алматы Алмаатинская область Қазақстан")
        
        
        
        

        let g1 = Group(groups: nil, name: "MOSQUES", places: [m1, m2, m3, m4, m5, m6, m7, m8, m9], titleImage: UIImage(named: "m1")!)
        
        let g12 = Group(groups: nil, name: "PRAYER HALLS", places: [n1, n2, n3, n4, n5], titleImage: UIImage(named: "m1")!)
        
       
        
        
   

        
        let bigGroup1 = Group(groups: [g1, g12], name: "Prayer Rooms", places: nil, titleImage: UIImage(named: "mini1")!)
        
        
        self.groups = [bigGroup1]
        
        
        
        let ev1 = Event(title: "Eid Mubarak", icon: UIImage(named: "eid")!, description: "The holiday is typically celebrated with prayers, feasting, and spending time with family and friends. It is a time of great joy and thanksgiving, as Muslims express their gratitude to Allah for the strength and guidance to observe the fast and for the blessings they have received throughout the year. In many Muslim countries, Eid al-Fitr is a public holiday, and schools, government offices, and businesses may be closed for several days to allow people to celebrate with their families and communities.")
        
        let ev2 = Event(title: "Mawlid al-Nabi", icon: UIImage(named: "mavled")!, description: "Maulid celebrations vary from region to region and can include parades, feasts, and other forms of public and private celebration. While the celebration of the Prophet's birthday is not universally practiced by all Muslims, it is an important occasion for many who see it as a way to show love and reverence for the Prophet and to strengthen their connection to their faith")
        
        let ev3 = Event(title: "Eid al-Adha", icon: UIImage(named: "adha")!, description: "The holiday commemorates the willingness of Prophet Ibrahim (Abraham) to sacrifice his son as an act of obedience to Allah. As a result of Ibrahim's devotion, Allah replaced his son with a sacrificial animal, which is why Muslims traditionally sacrifice a sheep, goat, cow or camel during the holiday.")
        
        let ev4 = Event(title: "Hajj", icon: UIImage(named: "hajj")!, description: "Hajj is the annual Islamic pilgrimage to Mecca that is required of all physically and financially able Muslims at least once in their lifetime. It is one of the five pillars of Islam, along with Shahada (declaration of faith), Salat (prayer), Zakat (charity), and Sawm (fasting during Ramadan).")
    
        self.events = [ev1, ev2, ev3, ev4]
    }
    
    
    
}

extension String{
    func widthOfString(usingFont font: UIFont) -> CGFloat{
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = (self as NSString).size(withAttributes: fontAttributes)
        return ceil(size.width)
    }
}

