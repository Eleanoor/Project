//
//  SearchBarViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 07-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces


import UIKit
import GoogleMaps
import GooglePlaces

class SearchBarViewController: UIViewController, GMSAutocompleteViewControllerDelegate {
    
  
    var addressTapped: Int!
    var addressItem: GMSPlace?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    
    
    // MARK: GOOGLE AUTO COMPLETE DELEGATE
    
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        addressItem = place
        
        performSegue(withIdentifier: "UnwindSegue", sender: self)
       // let camera = GMSCameraPosition.camera(withLatitude: place.coordinate.latitude, longitude: place.coordinate.longitude, zoom: 15.0)
       // self.googleMapsView.camera = camera
        //self.dismiss(animated: true, completion: nil) // dismiss after select place
        
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        
        print("ERROR AUTO COMPLETE \(error)")
        
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        self.dismiss(animated: true, completion: nil) // when cancel search
    }
    
    
    @IBAction func searchButtonTapped(_ sender: Any) {
        let autoCompleteController = GMSAutocompleteViewController()
        autoCompleteController.delegate = self
        
        //self.locationManager.startUpdatingLocation()
        self.present(autoCompleteController, animated: true, completion: nil)
    }
    
    /// Function that sends the getten adress item to the addressViewController.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindSegue" {
            switch addressTapped {
            case 1:
                let addressController = segue.destination as! AddressViewController
                addressController.addressItem1 = self.addressItem
            case 2:
                let addressController = segue.destination as! AddressViewController
                addressController.addressItem2 = self.addressItem
            default:
                print("Default")
            }
        }
    }
    

    
    
}
