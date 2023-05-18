//
//  DetailMapViewCell.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 17.05.2023.
//

import UIKit
import MapKit

class DetailMapViewCell: UITableViewCell {
    
    @IBOutlet var mapView: MKMapView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.mapView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(location: String){
        let geoCoder = CLGeocoder()
        
        print(location)
        geoCoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks{
                
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: false)
                    
            
                }
            }
        }
    }
    
    

}
