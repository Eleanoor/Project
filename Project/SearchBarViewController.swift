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


class SearchBarViewController: UIViewController, UISearchBarDelegate,  GMSAutocompleteFetcherDelegate, LocateOnTheMap {
    
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
        
        addressItem = Address(name: title, lon: lon, lat: lat)
        
        
        performSegue(withIdentifier: "UnwindSegue", sender: nil)
    }
    

    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        for prediction in predictions {
            print(prediction, "predictin")
            if let prediction = prediction as GMSAutocompletePrediction?{
                self.resultsArray.append(prediction.attributedFullText.string)
            }
        }
        self.searchResultController.reloadDataWithArray(self.resultsArray)
    }

    public func didFailAutocompleteWithError(_ error: Error) {
    }

    
    
    // MARK: - Variables
    var searchResultController: SearchResultsController!
    var resultsArray = [String]()
    var gmsFetcher: GMSAutocompleteFetcher!
    var addressItem: Address?

    
    
    // MARK: - Functions
    
    /// Function for loading view controller.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Function that displays the resultsoptions.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
        gmsFetcher = GMSAutocompleteFetcher()
        gmsFetcher.delegate = self
    }

   /// Function that shows search bar if search button is tapped.
    @IBAction func searchButtonTapped(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.delegate = self
        self.present(searchController, animated:true, completion: nil)
    }

    /// Function for when text changes.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.resultsArray.removeAll()
        gmsFetcher?.sourceTextHasChanged(searchText)
    }

//    /// Function that returns to the address screen if the resultlist is clicked.
//    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
//
//       /// unwind segue
//       performSegue(withIdentifier: "adressSegue", sender: self)
//
//
//        // Save lon and lat of searched location
////        addressItem1.name =
////        addressItem1.lon =
////        addressItem1.lat =
////
////        addressItem2.name =
////        addressItem2.lon =
////        addressItem2.lat =
////
//   }
//
    
    /// Function that
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
