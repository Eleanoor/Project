# Design Document
Minor Programming, Design Document, Eleanoor Polder, 10979301

### Advanced sketch
![Visualisation](doc/AdvancedSketch.png)

### Classes
* WelcomeViewController.swift
  * Functions:
    * override func viewDidLoad()
    * override func didReceiveMemoryWarning()
* AddressViewController.swift
  * Functions:
    * public func didAutocomplete()
    * public func didFailAutocompleteWithError()
    * func getAddress1()
    * func getAddress2()
    * override func viewDidLoad()
    * override func viewDidAppear()
    * func searchBar()
    * override func didReceiveMemoryWarning()
* MapsViewController.swift
  * Functions:
    * locationButtonTapped()
    * override func viewDidLoad()
    * prepare()
* DetailsViewController.swift
  * Functions:
    * showInformation()
    * override func viewDidLoad()
* LocationController.swift
  * Functions:
    * fetchMaps()
    * fetchReview()
    * override func viewDidLoad()
* SearchResultsController.swift
  * Functions:
    * override func tableView()
    * func reloadDataWithArray
    * override func didReceiveMemoryWarning()
    * override func viewDidLoad()
* LocationData
  * Structs:
    * Location:  
      X  
      Y  
      Review  
      Address  
      OpeningHours  
      
### API keys
Google Maps API Key: AIzaSyBwzCKh-gW1dZZ6k317ysgxkDHpgGmwpr8
Google Maps Places API Key: AIzaSyBk6SB23PYD0pNVA-05LCbHLBk9YwGpjiM
TripAdvisor API Key: Requested  
NS API Key: Requested



