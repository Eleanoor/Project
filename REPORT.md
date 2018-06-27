
# Report
Minor Programming, Final Project, Report  
Eleanoor Polder, 10979301

## Description of the application
The application is made for two people who want to meet. The problem is that they do not know where and both parties do not want to travel to far. The solution for this problem is to meet in the middle! So the user fills in two addresses and the app gives te middle in a red marker on the map. Around the red marker are three purple marker with the top three nearest cafes/bars/restaurans. By tapping on the marker an infowindow is shown. By tapping the infowindow, you will do to the details about that places such ass name, address, rating an if it's open. 

## Technical design
This pharagraph contains the functionality implemented in my code. Starting with a high level overview and followed by details. 

### High Level overview
The app starts with a WelcomeViewController, here you can create an account or log in to your already excisting account. The users profiles are connected with Firebase. Hereafter, the user goes to the AddressViewController. This screen contains three buttons: Address1, Address2 and Get Locations. By clicking on the Address1 or Address2 button, the user will go to the SearchBarViewController. By clicking on the searchbutton in the navigation bar the user gets the option to search for addresses, under the searchbar a tableview with suggestions will be 

### Details

## Challenges
The first challenge I had during this process was implementing the autocomplete of the adresses. I made a new ViewController for it because it would have been a better design for the application. After importing the google places API and doing some research about the autocomplete function.  
The second challenge was decoding the JSON for the nearby search for the restaurants and bars around the middle point. After decoding, selected data was stored in structs. The JSON was realy hard to read because it has multiple nested objects. Luckely this problem was easily solved by Coding Keys.   
The last and hardest challenge was getting a solution for if the middle point was in water instead of land. If the middle is in the water, the nearbysearch function of google places API does not work. If the middle point in the water was in the water but nearby land, the google places api with radius instead of nearbysearch could find restaurants on the land near the water. If the middle point was in the middle of a big ocean, the google places API cannot find a location nearby the middle. In this case an UI Alert pops up which tells you that between the chosen locations, there is no location near your middle point. 

## Decisions 
The decisions about the m
