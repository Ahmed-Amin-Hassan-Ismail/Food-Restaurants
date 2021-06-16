//
//  MapViewController.swift
//  FoodPin
//
//  Created by Amin  on 11/14/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    //Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    //Instance Variable
    var restaurant: Restaurant!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //map view delegate
        mapView.delegate = self
        
        // showing traffic , scale , compass
        mapView.showsTraffic = true
        mapView.showsScale = true
        mapView.showsCompass = true
        
        
        //convert address to coordinate and add annotation
        
        // get location
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(restaurant.location) { (placemarks, errors) in
            if let errors = errors {
                print(errors.localizedDescription)
                return
            }
            // get the first placemark
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                //add annotation
                let annotation = MKPointAnnotation()
                annotation.title = self.restaurant.name
                annotation.subtitle = self.restaurant.type
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    
                    //Display the annotation
                    self.mapView.showAnnotations([annotation], animated: true)
                    self.mapView.selectAnnotation(annotation, animated: true)
                }
            }
        }
    }
    
    //MARK: - Map View Delegate
    
    func mapView(_ mapView: MKMapView,
                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "myMarker"
        
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        //reuse the annotation
        var annotationView: MKMarkerAnnotationView? = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        
        annotationView?.glyphText = "😋"
        annotationView?.markerTintColor = UIColor.orange
        
        return annotationView
    }
}
