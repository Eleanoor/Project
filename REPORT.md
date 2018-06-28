
# Report
Minor Programming, Final Project, Report  
Eleanoor Polder, 10979301

## Description of the application
The application is made for two people who want to meet. The problem is that they do not know where and both parties do not want to travel to far. The solution for this problem is to meet in the middle! So the user fills in two addresses and the app gives te middle in a red marker on the map. Around the red marker are three purple marker with the top three nearest cafes/bars/restaurans. By tapping on the marker an infowindow is shown. By tapping the infowindow, you will do to the details about that places such ass name, address, rating an if it's open. 

## Technical design
This pharagraph contains the functionality implemented in my code. Starting with a high level overview and followed by details. 
![Design](doc/Design.png)

### High Level overview
The app starts with a WelcomeViewController, here you can create an account or log in to your already excisting account. The users profiles are connected with Firebase. Hereafter, the user goes to the AddressViewController. This screen contains three buttons: Address1, Address2 and Get Locations. By clicking on the Address1 or Address2 button, the user will go to the SearchBarViewController. By clicking on the searchbutton in the navigation bar the user gets the option to search for addresses, under the searchbar a tableview with suggestions will be given every time you change a letter (autocomplete). After an address is chosen, the text of the button changes to the chosen address. After both addresses are filled in, you can choose the get locations button. This will give you the map with 5 markers: 3 red markers (two for the the addresses en one for the middlepoint of the addresses) and 3 purple markers (for the top three restaurants in near the middlepoint). By tapping on the markers an infowindow will pop upp with information about the locations. When tapping on the infowindow of one of the purple markers the user will be send to the DetailsViewController. 

### Details
It starts in the WelcomeViewController. The two main functions in this file are createAccountButtonTapped and LogInButtonTapped. With the Auth.auth().CreateUser and Auth.auth().SignIn functions a new account will be created or an already excisting account will be logged in. If an error occurs, an UI Alert will pop up with a message that contains the error.  

After a succesfull login or creating account the user will be lead to the AddressViewController. The following functions are used. 
@IBAction func unwindToAdressViewController: this function a function that will logg out the current logged in user, and will send the user to the WelcomeViewController.   
@IBAction func address1ButtonTapped: This function will give the variable AddressTapped value of 1 and performs a segueway to searchBarViewController.   
@IBAction func address2ButtonTapped: This function will give the variable AddressTapped value of 2 and performs a segueway to searchBarViewController.   
@IBAction func getLocationsButtonTapped: This button will perform the segueway to the MapsViewController. This will only happen if both Addresses are filled in, if not an UI Alert will pop up that tells the user to fill in both addresses.   
@IBAction func LogOutButtonTapped: This function will give the variable AddressTapped value of 1 and performs a segueway to searchBarViewController. 
@IBAction func unwindToAdressViewController:  Function for unwind Segue from SearchBarViewController, it changes the text of the addressbuttons to the address chosen in SearchBarViewController, depending on which button is tapped.
override func prepare: This sends the values of addressItem1 and addresItem2 (more about these classes later) to MapsViewController and the value of addressTapped to SearchBarViewController.     

So after one of the Address buttons is tapped, the user will go to the SearchBarViewController, this contains the following functions:
@IBAction func searchButtonTapped: This function is called in the viewDidLoad, this functions makes sure that the user can put in an address and a list of suggestions will pop up under the searchbar, this is GMSAutocomplete.
func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace): If one of the suggestions is tapped on the GMSPlace that belongs to that address is saved as addressItem. After that, the unwind segueway to the AddressViewController. 
func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error): Function that prints an error if the GMSAutocomplete does not work.  
func wasCancelled(_ viewController: GMSAutocompleteViewController): Function that cancels a search.
override func prepare: this function sends the addressItem to the AddressViewController, depending on which address button is tapped in the AddressViewController, this depends on the value of addressTapped. 







## Challenges
The first challenge I had during this process was implementing the autocomplete of the adresses. I made a new ViewController for it because it would have been a better design for the application. After importing the google places API and doing some research about the autocomplete function.  
The second challenge was decoding the JSON for the nearby search for the restaurants and bars around the middle point. After decoding, selected data was stored in structs. The JSON was realy hard to read because it has multiple nested objects. Luckely this problem was easily solved by Coding Keys.   
The last and hardest challenge was getting a solution for if the middle point was in water instead of land. If the middle is in the water, the nearbysearch function of google places API does not work. If the middle point in the water was in the water but nearby land, the google places api with radius instead of nearbysearch could find restaurants on the land near the water. If the middle point was in the middle of a big ocean, the google places API cannot find a location nearby the middle. In this case an UI Alert pops up which tells you that between the chosen locations, there is no location near your middle point. 

## Decisions 
The decisions for a solution if the middle was in the middle of an ocean of other big water was the hardest. This app is originally made for finding the middle on small scale. Between two streets in the same city or between two cities nearby eachother (same country). However, if you want the middle between New York and Amsterdam, the middle is in the middle of the ocean. If I would have more time I would have implemented that on big scale search, the middle of the route between the two addresses will be given instead of the middle on the ground. 


