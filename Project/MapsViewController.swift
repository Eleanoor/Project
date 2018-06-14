//
//  MapsViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit
import GoogleMaps

class MapsViewController: UIViewController, GMSMapViewDelegate {

    var mapView: GMSMapView!
    
    var addressItem1: Address?
    var addressItem2: Address?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup map view.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        // Add marker address 1.
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: addressItem1!.lon, longitude: addressItem1!.lat)
        marker1.title = addressItem1!.name
        marker1.map = mapView
        
        // Add marker address 2.
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: addressItem2!.lon, longitude: addressItem2!.lat)
        marker2.title = addressItem2!.name
        marker2.map = mapView
        
        let latMiddle = (addressItem1!.lon + addressItem2!.lon)/2
        let lonMiddle =  (addressItem1!.lat + addressItem2!.lat)/2
        
        // Add marker in the middle.
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: latMiddle, longitude: lonMiddle)
        marker3.title = "Middle"
        marker3.map = mapView
    }

  
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        performSegue(withIdentifier: "DetailsSegue", sender: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
