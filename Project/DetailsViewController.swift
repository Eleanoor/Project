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
    
    // MARK: - Variables
    var latMiddle: Double?
    var lonMiddle: Double?
    var markerChosen: Int?
    var index: Int?
    
    // MARK: - Functions
    
    /// Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Change text of labels.
        LocationController.shared.fetchRestaurants(lat:latMiddle!, lng:lonMiddle!) { (location) in
            guard let location = location else {return}

            DispatchQueue.main.async {
                self.index = self.markerChosen! - 4
                self.nameLabel.text = location[self.index!].name
                self.addressLabel.text = location[self.index!].vicinity
                
                
                switch location[self.index!].openNow {
                case true:
                    self.openingHoursLabel.text = "Now Open"
        
                case false:
                    self.openingHoursLabel.text = "Now Closed"
                case .none:
                    print("none")
                case .some(_):
                    print("some")
                }
                
                
                if let rating = location[self.index!].rating {
                    self.reviewLabel.text = String(format: "%.1f", rating)
                }
                else {
                    self.reviewLabel.text = "no rating availible"
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
