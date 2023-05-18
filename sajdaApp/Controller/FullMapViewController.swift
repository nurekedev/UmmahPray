//
//  FullMapViewController.swift
//  sajdaApp
//
//  Created by Nurzhan Saktaganov on 17.05.2023.
//

import UIKit
import MapKit

class FullMapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var place: Place?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.delegate = self
        self.mapView.showsTraffic = true
        self.mapView.showsScale = true
        self.mapView.showsCompass = true
        
        // Converting address to coordinate
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(place!.location) { (placemarks, error) in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks{
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                annotation.title = self.place?.title
                
                if let location = placemark.location{
                    annotation.coordinate = location.coordinate
                    
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }

       
    }
    

 

}


extension FullMapViewController: MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation.isKind(of: MKUserLocation.self){
            return nil
        }
        
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: CF.Map.marker) as? MKMarkerAnnotationView
        
        if annotationView == nil{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: CF.Map.marker)
        }
        
        annotationView?.glyphText = "🕌"
        annotationView?.markerTintColor = .blue
        
        return annotationView
        
        
        
    }
}
