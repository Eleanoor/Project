//
//  DetailsViewController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openingHoursLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    var latMiddle: Double?
    var lonMiddle: Double?
    var markerChosen: Int?
    
    // MARK: - Functions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Change text of labels.
        LocationController.shared.fetchRestaurants(lat:latMiddle!, lng:lonMiddle!) { (location) in
            guard let location = location else {return}

            DispatchQueue.main.async{
                if self.markerChosen == 4 {
                    self.nameLabel.text = location[0].name
                    self.addressLabel.text = location[0].vicinity
                    self.openingHoursLabel.text = "open"
                    self.reviewLabel.text = String(format: "%.1f", location[0].rating!)
                }
                if self.markerChosen == 5 {
                    self.nameLabel.text = location[1].name
                    self.addressLabel.text = location[1].vicinity
                    self.openingHoursLabel.text = "open"
                    self.reviewLabel.text = String(format: "%.1f", location[1].rating!)
                }
                if self.markerChosen == 6 {
                    self.nameLabel.text = location[2].name
                    self.addressLabel.text = location[2].vicinity
                    self.openingHoursLabel.text = "open"
                    self.reviewLabel.text = String(format: "%.1f", location[2].rating!)
                }
                
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
