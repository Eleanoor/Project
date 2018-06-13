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
    
    var addressTapped: Int 
    
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
    
    @IBAction func unwindToAdressViewController(segue: UIStoryboardSegue){
    }
    
    @IBAction func address1ButtonTapped(_ sender: UIButton) {
        addressTapped = 1
        performSegue(withIdentifier: "Address1Segue", sender: self)
    }
    @IBAction func address2ButtonTapped(_ sender: UIButton) {
        addressTapped = 2
        performSegue(withIdentifier: "Address2Segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MapsSegue" {
            let mapsController = segue.destination as! MapsViewController
            addressItem1 = mapsController.addressItem1
            addressItem1 = mapsController.addressItem1
        }
        
        if segue.identifier == "Address1Segue" || segue.identifier == "Address2Segue" {
            let addressController = segue.destination as! AddressViewController
            addressTapped = addressController.addressTapped
        }
    }
}
