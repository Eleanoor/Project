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
    // UISearchBarDelegate, GMSAutocompleteFetcherDelegate
    
//    public func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
//        for prediction in predictions {
//            print(prediction, "predictin")
//            if let prediction = prediction as GMSAutocompletePrediction!{
//                self.resultsArray.append(prediction.attributedFullText.string)
//            }
//        }
//        self.searchResultController.reloadDataWithArray(self.resultsArray)
//    }
//
//    public func didFailAutocompleteWithError(_ error: Error) {
//    }
//
//


    //
//    var searchResultController: SearchResultsController!
//    var resultsArray = [String]()
//    var gmsFetcher: GMSAutocompleteFetcher!
//    var addressItem1 = [Address]()
//    var addressItem2 = [Address]()
//
//    // MARK: - Functions
//
//    /// Function that gives searchbar for address 1
//    @IBAction func getAdress1(_ sender: Any) {
//        let searchController = UISearchController(searchResultsController: searchResultController)
//        searchController.searchBar.delegate = self
//        self.present(searchController, animated:true, completion: nil)
//
//    }
//
//    /// Function that gives searchbar for address 2
//    @IBAction func getAddress2(_ sender: Any) {
//        let searchController = UISearchController(searchResultsController: searchResultController)
//        searchController.searchBar.delegate = self
//        self.present(searchController, animated:true, completion: nil)
//    }
//
    /// Function
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//
//    /// Function that displays the resultsoptions.
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
//
//        searchResultController = SearchResultsController()
//        gmsFetcher = GMSAutocompleteFetcher()
//        gmsFetcher.delegate = self
//    }
//
//
//    /// Function for when text changes.
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.resultsArray.removeAll()
//        gmsFetcher?.sourceTextHasChanged(searchText)
//    }
//
//
//    /// Function that returns to the address screen if the resultlist is clicked.
//    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
////        super.viewDidLoad()
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
//
//    }
//
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
