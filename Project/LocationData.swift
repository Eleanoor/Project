//
//  DataController.swift
//  Project
//
//  Created by Eleanoor Polder on 05-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import Foundation

struct LocationData {
    var lat: Double?
    var lng: Double?
    var name: String?
    var openNow: Bool?
    var rating: Double?
    var vicinity: String?
    
//    enum RootKeys: String, CodingKey {
//        case htmlAttributions = "html_attributions", nextPageToken = "next_page_token", results, status
//    }
//
    enum RootKeys: String, CodingKey {
        case geometry, icon, id, name, openingHours = "opening_hours", photos, placeId = "place_id", rating, reference, scope, type, vicinity
    }
    
    enum GeometryKeys: String, CodingKey {
        case location, viewport
    }
    
    enum LocationKeys: String, CodingKey {
        case lat, lng
    }
    
//    enum ViewportKeys: String, CodingKey {
//        case northeast, southwest
//    }
//
//    enum NortheastKeys: String, CodingKey {
//        case lat, lng
//    }
    
//    enum SouthwestKeys: String, CodingKey {
//        case lat, lng
//    }
//    
    enum PhotosKeys: String, CodingKey {
        case height,htmlAttributions = "html_attributions", photoReference = "photo_reference", width
    }
    
    enum OpeninghoursKeys: String, CodingKey {
        case openNow = "open_now", weekdayText = "weekday_text"
    }
    
}

extension LocationData: Decodable {
    
    init(from decoder: Decoder) throws {
        // id
        let container = try decoder.container(keyedBy: RootKeys.self)
   
        
        // Name, rating and vicinity directly out ResultsKey.
//        let resultContainer = try container.nestedContainer(keyedBy: ResultKeys.self, forKey: .results)
        name = try? container.decode(String.self, forKey: .name)
        rating = try? container.decode(Double.self, forKey: .rating)
        vicinity = try? container.decode(String.self, forKey: .vicinity)
        
        // Longitude and Latitude from LocationKeys.
        let geometryContainer = try container.nestedContainer(keyedBy: GeometryKeys.self, forKey: .geometry)
        
        let locationContainer = try geometryContainer.nestedContainer(keyedBy: LocationKeys.self, forKey: .location)
        lat = try? locationContainer.decode(Double.self, forKey: .lat)
        lng = try? locationContainer.decode(Double.self, forKey: .lng)
        
        let openingHoursContainer = try? container.nestedContainer(keyedBy: OpeninghoursKeys.self, forKey: .openingHours)
        if let openingHoursContainter = openingHoursContainer{
            openNow = try? openingHoursContainter.decode(Bool.self, forKey: .openNow)
            
        }
    }
    
}

struct LocationDatas: Decodable {
    let results: [LocationData]
}
