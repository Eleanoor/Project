//
//  MapsViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  This class represents the view and actions on the maps screen.

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
    let marker4 = GMSMarker()
    let marker5 = GMSMarker()
    let marker6 = GMSMarker()
    var latMiddle = Double()
    var lonMiddle = Double()
    var markerChosen = 0
    
    // MARK: - Functions
    
    /// Function that loads all the features on the screen.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Calculate middle point.
        latMiddle = (addressItem1!.coordinate.latitude + addressItem2!.coordinate.latitude)/2
        lonMiddle =  (addressItem1!.coordinate.longitude + addressItem2!.coordinate.longitude)/2

        // Setup map view.
        let camera = GMSCameraPosition.camera(withLatitude: latMiddle, longitude: lonMiddle, zoom: 15)
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
        
        // Add 3 markers for the restaurants/bars.
        LocationController.shared.fetchRestaurants(lat:latMiddle, lng:lonMiddle) { (location) in
            if let location = location {
                if location.count != 0 {
                    DispatchQueue.main.async{
                       
                        // Add marker 4.
                        self.marker4.position = CLLocationCoordinate2D(latitude: location[0].lat!, longitude: location[0].lng!)
                        self.marker4.title = location[0].name
                        self.marker4.map = mapView
                        self.marker4.icon = GMSMarker.markerImage(with: .purple)
                        
                        // Add marker 5.
                        self.marker5.position = CLLocationCoordinate2D(latitude: location[1].lat!, longitude: location[1].lng!)
                        self.marker5.title = location[1].name
                        self.marker5.map = mapView
                        self.marker5.icon = GMSMarker.markerImage(with: .purple)
                        
                        // Add marker 6.
                        self.marker6.position = CLLocationCoordinate2D(latitude: location[2].lat!, longitude: location[2].lng!)
                        self.marker6.title = location[2].name
                        self.marker6.map = mapView
                        self.marker6.icon = GMSMarker.markerImage(with: .purple)
                        
                    }
                }
            }
            else {
                
                // UI ALert if no locations are found. 
                let alertController = UIAlertController(title: "You are to far away from anything in the normal world", message: "I'm sorry, but you cannot see your friend.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }

    /// Function that performs segue if marker is tapped.
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        
        switch marker {
        case marker4:
            markerChosen = 4
            performSegue(withIdentifier: "DetailsSegue", sender: self)
        case marker5:
            markerChosen = 5
            performSegue(withIdentifier: "DetailsSegue", sender: self)
        case marker6:
            markerChosen = 6
            performSegue(withIdentifier: "DetailsSegue", sender: self)
        default:
            print("default")
        }
    }
    
    /// Function that sends values to detailsviewcontroller.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "DetailsSegue" {
            let detailsController = segue.destination as! DetailsViewController
            detailsController.latMiddle = latMiddle
            detailsController.lonMiddle = lonMiddle
            detailsController.markerChosen = markerChosen
        }
    }
}
