//
//  LocationController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//
//  This class implemented the restaurants near the middle point with a nearbysearch function of the google maps API.

import Foundation

class LocationController {
    
    static let shared = LocationController()
    
    /// Function that returns data depending if the middle is in water or not, otherwise nil.
    func fetchRestaurants(lat: Double, lng: Double, completion: @escaping ([LocationData]?) -> Void) {
        fetchRestaurantsHelper(lat: lat, lng: lng, inwater: false) { (data) in
            
            // Checks if location is in water.
            if let data = data {
                if data.count != 0 {
                    completion(data)
                }
                
                // Gets other API if location is in water.
                else {
                    self.fetchRestaurantsHelper(lat: lat, lng: lng, inwater: true, completion: { (data) in
                        if let data = data {
                            if data.count != 0 {
                                completion(data)
                            }
                                
                            // Complete nil if location is in the middle of ocean and no restaurants are near.
                            else {
                                completion(nil)
                            }
                        }
                    })
                }
            }
        }
    }
    
    /// Function that converts JSON into struct.
    private func fetchRestaurantsHelper(lat: Double, lng: Double, inwater: Bool, completion: @escaping ([LocationData]?) -> Void) {
        
        // API if location is on land.
        var url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(lng)&rankby=distance&type=restaurant&type=bar&key=AIzaSyAfbusZOf0qLnSdPBlMQXVwG4PStC29JrQ")!
        
        // API if location is on water.
        if inwater {
            url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(lng)&radius=50000&type=restaurant&type=bar&key=AIzaSyAfbusZOf0qLnSdPBlMQXVwG4PStC29JrQ")!
        }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard let data = data else {return}
            
            do {
                let location = try JSONDecoder().decode(LocationDatas.self, from: data)
                completion(location.results)
            }
            catch {
                print("Error: \(error)")
            }
        }
        task.resume()
    }
}
