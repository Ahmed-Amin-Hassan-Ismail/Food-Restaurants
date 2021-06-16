//
//  RestaurantDetailMapCell.swift
//  FoodPin
//
//  Created by Amin  on 11/14/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import MapKit

class RestaurantDetailMapCell: UITableViewCell {
    
    //Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    //MARK:- Location
    
    func getMyLocation(location: String) {
        
        // get location
        let geocoder = CLGeocoder()
        print(location)
        
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let placemarks = placemarks {
                
                // get the first place
                let placemark = placemarks[0]
                
                //Add annotation
                let annotation = MKPointAnnotation()
                if let location = placemark.location {
                    
                    //Display the annotation
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    //set the zoom level
                    let region =
                        MKCoordinateRegion(center: annotation.coordinate,
                                           latitudinalMeters: 250,
                                           longitudinalMeters: 250)
                    self.mapView.setRegion(region, animated: true)
                }
            }
        }
    }
}
