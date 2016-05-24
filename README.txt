README.txt

Within the ‘Creative Program’ Folder, the following files can be found in the ‘Footprint’ folder: 

# Footprint: Indoor Location with Core Location
Display device location against a custom floorplan PDF.
 * First, we will draw your floorplan inside MapKit so that it matches its real-world Latitude/Longitude values.
 * Then, using CoreLocation, we will take the position in Latitude/Longitude and display it in MapKit.

We will demonstrate how to do the conversions between Geographic coordinate systems (Latitude/Longitude), floorplan PDF coordinate systems (x,y), and MapKit coordinates.

Note: For this sample to show a real location & floor number, you must have a floorplan for a venue that is Indoor Positioning-enabled and the device will need to be in that venue. If you are not in a venue, try emulating a position in the venue using "Custom Location" in the simulator. Otherwise, the user's location will be shown far from the default floorplan and venue displayed in this app. Additionally, to ensure that user location is actually visible, you will need to enable it in the Attribute Inspector on the Map View in Main.storyboard. From there, the user would need to either allow the app to use their location from Settings or select "Allow" when prompted by the app the first time it is run.

#Main.storyboard
The visual file that is used to set up and organize all of the elements on the screen of the main view controller that displays throughout the execution of the app. Holds the constraints for all the visual items (map, buttons, toolbars, etc.) on the screen.

#Launch Screen.storyboard
The visual file that is used while the app is being launched and all of the files are being initialized. Displays the splash.jpg file.

#places.tsv
This is a tab-separated value sheet we compiled that contains the raw data for the pins and their connections. Each line has a number (the point number), GPS coordinates, a name (to be displayed on the pin/picker), and the numbers corresponding to the connections to be made.

#buildplaces
This is a script we wrote to be run on the command line. It is run simply in that in the directory you need the places.tv file, and nothing else. The command for the script is like this:
swift buildplaces.swift > places.swift
This will create a places.swift file that is the one described below. This file is then added to the project and read at runtime. This makes it easy to update the places.tv file and then not have to worry about changing all the other code as the script will do it for you.

#places
This is a completely original file that was written by a script that is included in buildplaces.swift. The resulting file, is the skeleton for the entire program. This file declares the two structs we use to store the data for each point (pin) on the map, and each connection (line) that goes between the points. There are 4 data structures that declare handle all of this information. The main one being the PLACES array that includes all the points and their locations where as the other structures are all derived for UI information (i.e. whether or not to draw a pin, the order for the picker, etc).

#MAP3.pdf
This is the map overlay that we obtained from the Holy Cross media department. This map was significantly edited by us to allow for the GPS coordinates to match up (i.e. bring the map more to scale) and clean up other extraneous symbols on the map. 
Ultimately, this file is mapped to the MapKit using GPS data and allows for a clean overlay to be presented to the user.

#splash.jpg
The image that is the loading image when the application is started. The “splash screen” image.

#shieldlogo.jpg
The small holy cross logo that is displayed in the navigation bar of the main.storyboard visual file.

# ViewController.swift
This is your main view controller class, which handles most of the display functionality. Several IBActions are available from the storyboard:

To help with debugging we’ve added a toolbar at the bottom to provide some common operations.
* Places: makes the view that displays the picker and all of the buttons for choosing to and from locations in order to calculate a route unhidden. 
* Close: removes the view which displays the picker of all the places available to choose from on campus and the toolbar which can be used to select the to and from locations. 
* From: set the current location in the picker of locations to a variable named origin in this ViewController code so that the route can be later calculated. An action also occurs to display a red pin on the screen once this location is chosen.
* To: set the current location in the picker to the destination variable in the ViewController code. This when used with the origin variable are used to calculate the shortest distance route between the two points. An action also occurs to display a red pin on the screen when a location is chosen. 
* Rotate: restores the origin camera view, centered on the pdf map or apple map. The map is also repositioned to orientate in a way in which the north side of the map is facing toward the top of the screen. 
* Debug: toggle between the pdf map and the apple map — shows additional overlays and annotations that correspond to the various internal variables inside the code. 

This file contains a mix of our own code and the general template for mkMapView and floorplan mapping that was available to use via the apple developer website https://developer.apple.com/maps/. About 50% of this code is completely our own code the other 50% is either direct lines from that apple footprint framework or slight modifications to various lines in order to correspond with the proof of concept that we set out to develop.  

# VisibleMapRegionDelegate
This file handles many of the manipulations of the camera that works with the mkMapView. There are several functions that create bounce back features and the users ability to manipulate that camera through apple’s multi-gesture features. This file is completely taken from the footprint framework and has not been modified in any way. 

# CoordinateConvereter
This is used as a converter from the coordinates in the PDF image of the floorplan to geographic coordinates. This may be modified to work with raster images such as JPEGs and PNGs but this is not recommended as they won't render as clearly. See comments for more information.

# FloorplanOverlay
This is used to describe the floorplan of an indoor venue and is based upon MKOverlay. This file is completely taken from the footprint framework and has not been modified in any way.

# FloorplanOverlayRenderer
This is used to render a FloorplanOverlay onto a map view and also handles some debugging tasks. This file is completely taken from the footprint framework and has not been modified in any way.

# HideBackgroundOverlay
This is used to hide MapKit's underlying map tiles so that only our floorplan is visible. We changed this file so that instead of the hidden map being written over by white tiles, it was covered by the same green color that is used in the background of the map.

# Utilities
Some additional Swift extensions. This file is completely taken from the footprint framework and has not been modified in any way.