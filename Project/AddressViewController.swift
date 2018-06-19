//
//  AddressViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces


class AddressViewController: UIViewController  {
    
    // MARK: - Variables
    var addressItem1: GMSPlace?
    var addressItem2: GMSPlace?
    var addressTapped = 0
//
//    enum numberTapped {
//        case 1, 2
//    }

    
    // MARK: - Outlets
    @IBOutlet weak var address1Button: UIButton!
    @IBOutlet weak var address2Button: UIButton!
    
    // MARK: - Functions
    /// Function that loads the viewcontroller.
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /// Function that 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /// Function for unwind Segue.
    @IBAction func unwindToAdressViewController(segue: UIStoryboardSegue){
        let searchBarController = segue.source as! SearchBarViewController
        switch searchBarController.addressTapped {
        case 1:
            addressItem1 = searchBarController.addressItem
            print(addressItem1!.name)
            address1Button.setTitle(addressItem1!.name, for: .normal)
        case 2:
            addressItem2 = searchBarController.addressItem
            address2Button.setTitle(addressItem2!.name, for: .normal)
        default:
            print("default")
        }
        
    }
    
    /// Function for when address 1 button is tapped.
    @IBAction func address1ButtonTapped(_ sender: UIButton) {
        addressTapped = 1
//        addressTapped = numberTapped.one
        performSegue(withIdentifier: "AddressSegue", sender: self)
    }
    
    /// Function for when address 2 button is tapped.
    @IBAction func address2ButtonTapped(_ sender: UIButton) {
        addressTapped = 2
//        addressTapped = numberTapped.two //ENUM
        performSegue(withIdentifier: "AddressSegue", sender: self)
    }
    
    /// Function that will send values to the MapsViewController and the SearchBarViewController. 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapsSegue" {
            let mapsController = segue.destination as! MapsViewController
            mapsController.addressItem1 = addressItem1
            mapsController.addressItem2 = addressItem2
        }
        if segue.identifier == "AddressSegue" {
            let searchBarController = segue.destination as! SearchBarViewController
            print(addressTapped)
            searchBarController.addressTapped = addressTapped
        }
    }
}
