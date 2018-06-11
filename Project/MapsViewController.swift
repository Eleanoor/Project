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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup map view.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        // Add marker address 1 an address 2.
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker1.title = "Sydney"
        marker1.map = mapView
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: -33.7, longitude: 151.0)
        marker2.title = "Sydney"
        marker2.map = mapView
        
        // Add marker middle.
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: -31, longitude: 150.0)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
