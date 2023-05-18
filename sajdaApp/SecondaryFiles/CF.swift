//
//  SA.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 19.04.2023.
//

import Foundation


struct CF{
    
    struct Cells{
        static let place = "PlaceViewCell"
        static let group = "GroupViewCell"
        static let categoryPlace = "CatogoryPlaceViewCell"
        static let tplaces = "PlacesCell"
        static let fullInfo = "DetailCell"
        static let event = "EventsCell"
        static let aboutCell = "MoreDetailedCell"
    }
    
    struct Controllers{
        static let subCategories = "SecondaryViewController"
        static let detil = "DetailViewController"
        static let eventVC = "EventDeatilViewController"
    }
    
    struct Segues{
        static let fullScreen = "fullInfo"
        static let addressOnMap = "showMap"
    }
    
    struct Map{
        static let marker = "myMark"
    }
    
}
