//
//  PrayerModel.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 16.04.2023.
//

import Foundation


struct PrayerModel: Codable{
    var data: Datas
}

struct Datas: Codable{
    var timings: Timings
    var meta: Meta
    
}

struct Timings: Codable{
    var Fajr: String
    var Sunrise: String
    var Dhuhr: String
    var Asr: String
    var Maghrib: String
    var Isha: String
}

struct Meta: Codable{
    var timezone: String
}

