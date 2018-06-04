# Project Proposal
Minor Programming, Project Proposal, Eleanoor Polder, 10979301

## Problem Statement
The problem is that you and your friend want to meet, but you don't know where. You want the spot to be in the middle of both addresses so both parties do not have to travel too far. Audience is two people who want to meet each other but they don't know where.


## Solution
* Summarize idea: The solution for this problem is an app that takes two addresses and gives a top three restaurants/cafes in the middle of the addresses.
* Visual sketch:
![Visualisation](doc/VisualSketch.png)
Main features:
* MPV:
  * Welcome screen with getting started button.
  * Address controller two address textfields and get locations - button.
  * A map with the top three locations in the middle.
  * Detail screen with the details about the tapped location: address, opening hours and TripAdvisor Reviews.
  * "Back"-button on the address screen, map screen and detail screen.
* Optional Features:
  * Include more optional addresses to implement. 
  * Include also API from the NS, so you can choose a NS stations in the middle of two addresses. 

## Prerequisites
* Data sources:
  * Google Maps API key with https://developers.google.com/maps/documentation/ios-sdk/get-api-key
* Review of similar mobile apps: "Meet me in the middle" is an similar mobile app, but it only gives the location of the spot in the middle, not a restaurant or other place to meet. 
Review: 
Jul 28, 2015
AJMcIntyre

"So simple!

So Easy! I have been researching places to meet with friends and family nearby. I have always missed the mark with timing for myself or the other party. This made it very simple to find the middle point and research things to do from there."

* Hardest parts: I think the hardest part is to load the data from the API keys.
