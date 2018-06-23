//
//  LocationController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import Foundation

class LocationController {
    
    static let shared = LocationController()
    
    func fetchRestaurants(lat: Double, lng: Double, completion: @escaping ([LocationData]?) -> Void) {
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(lat),\(lng)&rankby=distance&type=restaurant&type=bar&key=AIzaSyAfbusZOf0qLnSdPBlMQXVwG4PStC29JrQ")!
        
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
    // Api key for places search
//    let APIkey = "AIzaSyAfbusZOf0qLnSdPBlMQXVwG4PStC29JrQ"
//    
//    func fetchRestaurants(completion: @escaping ([String]?) -> Void) {
//
//        let url = URL(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(latMiddle),\(lonMiddle)&rankby=distance&type=restaurant&type=bar&key=AIzaSyAfbusZOf0qLnSdPBlMQXVwG4PStC29JrQ")!
//
//        let request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request) {
//            (data, response, error) in
//
//            guard let data = data else {return}
//
//            do {
//                let location = try JSONDecoder().decode([LocationData].self, from: data)
//            }
//            catch {
//                print("error")
//            }
//
//
//        }
//        task.resume()
//    }
}
