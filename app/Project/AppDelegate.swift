//
//  AppDelegate.swift
//  Project
//
//  Created by Eleanoor Polder on 04-06-18.
//  Copyright © 2018 Eleanoor Polder. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import Firebase

let googleApiKey = "AIzaSyBk6SB23PYD0pNVA-05LCbHLBk9YwGpjiM"


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    // Get API key for maps and places. 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        GMSServices.provideAPIKey("AIzaSyBwzCKh-gW1dZZ6k317ysgxkDHpgGmwpr8")

        GMSPlacesClient.provideAPIKey("AIzaSyBk6SB23PYD0pNVA-05LCbHLBk9YwGpjiM")
        
        FirebaseApp.configure()
        
        return true
    }
}
