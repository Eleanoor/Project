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
    var addressItem1: Address?
    var addressItem2: Address?
    var addressTapped = 0
    
    // MARK: - Outlets
    @IBOutlet weak var Address1Button: UIButton!
    @IBOutlet weak var Address2Button: UIButton!
    
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
    }
    
    /// Function for when address 1 button is tapped.
    @IBAction func address1ButtonTapped(_ sender: UIButton) {
        addressTapped = 1
        performSegue(withIdentifier: "AddressSegue", sender: self)
    }
    
    /// Function for when address 2 button is tapped.
    @IBAction func address2ButtonTapped(_ sender: UIButton) {
        addressTapped = 2
        performSegue(withIdentifier: "AddressSegue", sender: self)
    }
    
    /// Function that will send values to the MapsViewController and the SearchBarViewController. 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapsSegue" {
            let mapsController = segue.destination as! MapsViewController
            mapsController.addressItem1 = addressItem1
            mapsController.addressItem1 = addressItem1
        }
        if segue.identifier == "AddressSegue" {
            let searchBarController = segue.destination as! SearchBarViewController
            print(addressTapped)
            searchBarController.addressTapped = addressTapped
        }
    }
}
