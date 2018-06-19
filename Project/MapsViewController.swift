//
//  MapsViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapsViewController: UIViewController, GMSMapViewDelegate {

    // MARK: - Variables
    var mapView: GMSMapView!
    var addressItem1: GMSPlace?
    var addressItem2: GMSPlace?
    let marker1 = GMSMarker()
    let marker2 = GMSMarker()
    let marker3 = GMSMarker()
    

    
    // MARK: - Functions
    
    /// Function for loading the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize lon and lat for the middle.
        let latMiddle = (addressItem1!.coordinate.latitude + addressItem2!.coordinate.latitude)/2
        let lonMiddle =  (addressItem1!.coordinate.longitude + addressItem2!.coordinate.longitude)/2
        
        // Setup map view.
        let camera = GMSCameraPosition.camera(withLatitude: latMiddle, longitude: lonMiddle, zoom: 6)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        // Add marker address 1.
        marker1.position = CLLocationCoordinate2D(latitude: addressItem1!.coordinate.latitude, longitude: addressItem1!.coordinate.longitude)
        marker1.title = addressItem1!.name
        marker1.snippet = "Address 1"
        marker1.map = mapView
        
        // Add marker address 2.
        marker2.position = CLLocationCoordinate2D(latitude: addressItem2!.coordinate.latitude, longitude: addressItem2!.coordinate.longitude)
        marker2.title = addressItem2!.name
        marker2.snippet = "Address 2"
        marker2.map = mapView
        
        // Add marker in the middle.
        marker3.position = CLLocationCoordinate2D(latitude: latMiddle, longitude: lonMiddle)
        marker3.title = "Middle"
        
        marker3.map = mapView
        
    }

    /// Function that performs segue if marker is tapped.
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
//        if marker. {
            performSegue(withIdentifier: "DetailsSegue", sender: self)
//        }
    }
    
    
    /// Function
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
