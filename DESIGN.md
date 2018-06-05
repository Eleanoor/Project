# Design Document
Minor Programming, Design Document, Eleanoor Polder, 10979301

## Advanced sketch

## Classes
* WelcomeViewController.swift
  * Outlets:
    * welcomeLabel
    * gettingStartedButton
  * Functions:
    * gettinStartedButtonTapped()
    * updateUI()
* AddressViewController.swift
  * Outlets:
    * address1TextField
    * address2TextField
  * Functions:
    * getLocationsButtonTapped()
    * updateUI()
    * prepare()
* MapsViewController.swift
  * Outlets:
    * location1
    * location2
    * location3
  * Functions:
    * locationButtonTapped()
    * updateUI()
    * prepare()
* DetailsViewController.swift
  * Outlets:
    * titleLabel
    * addressLabel
    * reviewLabel
  * Functions:
    * 
* LocationController.swift
  * Functions:
    * fetchMaps()
    * fetchReview()
* LocationData
  * Structs:
    * Location:
      X
      Y
      Review
      Address
      OpeningHours
      
## API keys
Google Maps API Key: AIzaSyCz7gAArMJJYeHATmvT1DUNZ1hR7uixqq0
TripAdvisor API Key: Requested
NS API Key: 



