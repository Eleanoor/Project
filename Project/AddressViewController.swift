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


class AddressViewController: UIViewController, UISearchBarDelegate, GMSAutocompleteFetcherDelegate {
    
    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
        for prediction in predictions {
            print(prediction, "predictin")
            if let prediction = prediction as GMSAutocompletePrediction!{
                self.resultsArray.append(prediction.attributedFullText.string)
            }
        }
        self.searchResultController.reloadDataWithArray(self.resultsArray)
    }
    
    public func didFailAutocompleteWithError(_ error: Error) {
    }
    
    
    @IBOutlet weak var getLocationsButton: UIButton!
    
    var searchResultController: SearchResultsController!
    var resultsArray = [String]()
    var gmsFetcher: GMSAutocompleteFetcher!
    
    
    // MARK: - Functions
    
    /// Function that gives searchbar for address 1
    @IBAction func getAdress1(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.delegate = self
        self.present(searchController, animated:true, completion: nil)
        
    }
    
    /// Function that gives searchbar for address 2
    @IBAction func getAddress2(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.delegate = self
        self.present(searchController, animated:true, completion: nil)
    }
    
    /// Function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// Function that displays the resultsoptions.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)

        searchResultController = SearchResultsController()
        gmsFetcher = GMSAutocompleteFetcher()
        gmsFetcher.delegate = self
    }


    /// Function for when text changes.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.resultsArray.removeAll()
        gmsFetcher?.sourceTextHasChanged(searchText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
