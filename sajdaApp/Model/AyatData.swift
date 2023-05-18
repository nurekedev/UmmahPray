//
//  AyatData.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 23.04.2023.
//

import UIKit

struct AyatData: Codable{
    var data: ADatas
}

struct ADatas: Codable{
    var text: String
    var surah: Surah
    var numberInSurah: Int
}

struct Surah: Codable{
    var number: Int
    var englishName:String
}





