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
    
    /// Function that save longitude and latitude of tapped address.
    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
     
        addressItem = Address(name: title, lon: lon, lat: lat)
        print("about to")
        self.performSegue(withIdentifier: "UnwindSegue", sender: nil)
    }
    
    /// Function
    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        for prediction in predictions {
            if let prediction = prediction as GMSAutocompletePrediction? {
                self.resultsArray.append(prediction.attributedFullText.string)
            }
        }
        self.searchResultController.reloadDataWithArray(self.resultsArray)
    }

    /// Function for autocomplete.
    public func didFailAutocompleteWithError(_ error: Error) {
    }
    
    // MARK: - Variables
    var searchResultController: SearchResultsController!
    var resultsArray = [String]()
    var gmsFetcher: GMSAutocompleteFetcher!
    var addressItem: Address?
    var addressTapped: Int!

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
    
    /// Function tha
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindSegue" {
            switch addressTapped {
                case 1 :
                    let addressController = segue.destination as! AddressViewController
                    addressController.addressItem1 = self.addressItem
                
                case 2 :
                    let addressController = segue.destination as! AddressViewController
                    addressController.addressItem2 = self.addressItem
                default:
                    print("Default")
            }
        }
    }
    
    /// Function that
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
