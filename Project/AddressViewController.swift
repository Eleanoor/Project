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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    
    
    
//    /// Function that connects the question to the result view.
//    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
//        if segue.identifier == "MapsSegue" {
//            let AddressViewController = segue.destination as! ResultViewController
//            AddressViewController.addressItem1 = addressItem1
//            AddressViewController.addressItem2 = addressItem2
//        }
//    }


}
