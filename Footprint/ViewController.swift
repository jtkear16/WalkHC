/*
Fileaname: ViewController.swift
Names: Matt Gigliotti, JT Kearney, Abigail Oliver
Class: Programming Languages, Final Project
Professor: Laurie King

Abstract:
This file controls the primary view for the entire application for everything that is loaded
and interacted with after the initial splash screen.
It is in this file we draw the map, pins, and use the CoreLocation updates to display information
to the user.
*/

import CoreLocation
import Foundation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
	
	// Function to reset the lines
	func resetLines() {
		hideFloorplan()
		showFloorplan()
		route = []
	}
	
	// Function to reset the pins
	func resetPins(){
		hideDebugVisuals()
		var i = route.count
		while (i > 1){
			let sourceIndex = i - 1
			let destinationIndex = i - 2
			
			let c1 = route[sourceIndex].coordinate
			let c2 = route[destinationIndex].coordinate
			var a = [c1, c2]
			polyline = MKPolyline(coordinates: &a, count: a.count)
			mapView.addOverlay(polyline)
			i = i - 1
		}
		debuggingAnnotations = ViewController.createDebuggingAnnotationsForMapView(mapView!, aboutFloorplan: hcmap)
		showDebugVisuals()
	}
	
	// Picker variables
	var closestPoint: Int!
	var currentlocation = PICKERARRAY[0].1
	var originlocation = PICKERARRAY[0].1
	var destinationlocation = PICKERARRAY[0].1
	var changedOrigin = false
	var lockedOrigin = -1
	var lockedDest = -1
	
	
	// Picker reaction functions
	@IBOutlet weak var picker: UIPickerView!
	var pickerPlaces = PICKERARRAY
	
	// Other picker functions
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1;
	}
	
	// Tells the picker how many options there are
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerPlaces.count
	}
	
	// Returns the name of where you are in the picker
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerPlaces[row].0
	}
	
	// Puts the number for the location you are at in the picker into the current location variable
	func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		currentlocation = PICKERARRAY[row].1
	}
	
	// Origin button reaction
	@IBAction func originButton(sender: AnyObject) {
		if currentlocation == -1 {
			originlocation = closestPoint
			changedOrigin = false
		} else {
			originlocation = currentlocation
			changedOrigin = true
		}
		PINBOOL[originlocation] = true;
		lockedOrigin = originlocation
		var i = 0; while i < PINBOOL.count {
			if (i == lockedDest || i == lockedOrigin) { i = i + 1; continue }
			PINBOOL[i] = false;
			i = i + 1
		}
        resetLines()
		resetPins()
		// print("This is the origin \(originlocation)")
	}
	
	// Destination button reaction
	@IBAction func destinationButton(sender: AnyObject) {
		if currentlocation == -1 {
			destinationlocation = closestPoint
		} else {
			destinationlocation = currentlocation
		}
		PINBOOL[destinationlocation] = true;
		lockedDest = destinationlocation
		var i = 0; while i < PINBOOL.count {
			if (i == lockedDest || i == lockedOrigin) { i = i + 1; continue }
			PINBOOL[i] = false;
			i = i + 1
		}
        resetLines()    
		resetPins()
		// print("This is the destination \(destinationlocation)")
	}
	
	// Calculate route reaction
	@IBAction func calculateRoute(sender: AnyObject){
		if((originlocation != -1) && (destinationlocation != -1)) {
			print("You will be traveling from \(PLACES[originlocation].name) ")
			print(" to the \(PLACES[destinationlocation].name).")
			// Reset boolean array
			PINBOOL = [Bool](count: PINBOOL.count, repeatedValue: false)
			// reset the lines
			resetLines()
			// Do the steps
			PrintSteps(PLACES, src: originlocation, tar: destinationlocation)
			resetPins()
			
			// Current location name stuff
			var travelmsg:String = "You are going from: "
			var temp = PLACES[originlocation].name
			if temp.removeAtIndex(temp.startIndex) == "1" {
				travelmsg = travelmsg + "Current location"
			} else {
				travelmsg = travelmsg + PLACES[originlocation].name
			}
			travelmsg = travelmsg + " -> "
			temp = PLACES[destinationlocation].name
			if temp.removeAtIndex(temp.startIndex) == "1" {
				travelmsg = travelmsg + "Current location"
			} else {
				travelmsg = travelmsg + PLACES[destinationlocation].name
			}
			
			let alert = UIAlertController(title: "You are going from:", message: travelmsg, preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
		} else {
			let alert = UIAlertController(title: "Oops!", message: "We had some trouble.\n Please make sure you have an origin and destination and try again.", preferredStyle: UIAlertControllerStyle.Alert)
			alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
    @IBAction func placesButton(sender: AnyObject) {
        pickerVC.hidden = false
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        pickerVC.hidden = true
    }
    
    
    @IBOutlet weak var pickerVC: UIView!
    
	// Top Circle Button reaction
	// Call this to reset the camera.
	@IBAction func resetCamera(sender: AnyObject) {
		visibleMapRegionDelegate.mapViewResetCameraToFloorplan(mapView)
		originlocation = closestPoint
		changedOrigin = false
	}
	
	// Bottom Switch Reaction
	/**
	When the trashcan hasn't yet been pressed, this toggles the debug
	visuals. Otherwise, this toggles the floorplan.
	*/
	@IBAction func toggleDebugVisuals(sender: AnyObject) {
		if (sender.isKindOfClass(UISwitch.classForCoder())) {
			let senderSwitch: UISwitch = sender as! UISwitch
			/*
			If we have revealed the mapkit tileset (i.e. the trash icon was
			pressed), toggle the floorplan display off.
			*/
			if (mapKitTilesetRevealed == true) {
				if (senderSwitch.on == true) {
					hideFloorplan()
				} else {
					showFloorplan()
				}
			} else {
				if (senderSwitch.on == true) {
					showDebugVisuals()
				} else {
					hideDebugVisuals()
				}
			}
		}
	}
	
	/**
	Remove all the overlays except for the debug visuals. Forces the debug
	visuals switch off.
	*/
	@IBAction func revealMapKitTileset(sender: AnyObject) {
		mapView.removeOverlays(mapView.overlays)
		mapView.removeAnnotations(mapView.annotations)
		// Show labels for restaurants, schools, etc.
		// mapView.showsPointsOfInterest = true
		// Show building outlines.
		mapView.showsBuildings = true
		mapKitTilesetRevealed = true
		// Set switch to off.
		showDebugVisuals()
	}
	
	// CLASS VARIABLES
	/***********************************************************/
	/// Outlet for the map view in the storyboard.
	@IBOutlet weak var mapView: MKMapView!
	
	/// Outlet for the visuals switch at the lower-right of the storyboard.
	@IBOutlet weak var debugVisualsSwitch: UISwitch!
	
	/**
	To enable user location to be shown in the map, go to Main.storyboard,
	select the Map View, open its Attribute Inspector and click the checkbox
	next to User Location
	
	The user will need to authorize this app to use their location either by
	enabling it in Settings or by selecting the appropriate option when
	prompted.
	*/
	var locationManager: CLLocationManager!
	
	var hideBackgroundOverlayAlpha: CGFloat!
	
	/// Helper class for managing the scroll & zoom of the MapView camera.
	var visibleMapRegionDelegate: VisibleMapRegionDelegate!
	
	/// Store the data about our floorplan here.
	var hcmap: FloorplanOverlay!
	
	var debuggingAnnotations: [MKAnnotation]!
	
	/// This property remembers which floor we're on.
	var lastFloor: CLFloor!
	
	/**
	Set to false if you want to turn off auto-scroll & auto-zoom that snaps
	to the floorplan in case you scroll or zoom too far away.
	*/
	var snapMapViewToFloorplan: Bool!
	
	/**
	Set to true when we reveal the MapKit tileset (by pressing the trashcan
	button).
	*/
	
	var mapKitTilesetRevealed = false
	
	/***********************************************************/
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		
		self.picker.delegate = self
		self.picker.dataSource = self
        
        pickerVC.hidden = true
		
		let span = MKCoordinateSpanMake(0.015, 0.015)
		let coordinate = CLLocationCoordinate2DMake(42.236900, -71.808550)
		let region = MKCoordinateRegionMake(coordinate, span)
		
		self.mapView.setRegion(region, animated: true)
		
		// VARIABLES FOR LOCATION
		// Ask for permission to use location
		mapView.showsUserLocation = true
		locationManager = CLLocationManager()
		locationManager.desiredAccuracy = kCLLocationAccuracyBest
		locationManager.requestAlwaysAuthorization()
		locationManager.startUpdatingLocation()
		mapViewWillStartLocatingUser(mapView)
		
		// Configure our floorplan.
		
		/*
		We setup a pair of anchors that will define how the map pdf
		maps to geographic co-ordinates.
		
		The numbers were chosen as easy pdf coordinates and then based on that we took the geographic
		coordinates and connected them.
		*/
		
		// First Anchor (By Science Courtyard)
		let anchor1 = GeoAnchor(latitudeLongitudeCoordinate: CLLocationCoordinate2DMake(42.238617, -71.810483), pdfPoint: CGPointMake(250.0, 500.0))
		
		// Second Anchor (By Figge)
		let anchor2 = GeoAnchor(latitudeLongitudeCoordinate: CLLocationCoordinate2DMake(42.236976, -71.805191), pdfPoint: CGPointMake(500.0, 400.0))
		
		let anchorPair = GeoAnchorPair(fromAnchor: anchor1, toAnchor: anchor2)
		
		// === Initialize our assets
		
		/*
		We have to specify subdirectory here since we copy our folder
		reference during "Copy Bundle Resources" section under target
		settings build phases.
		*/
		let pdfUrl = NSBundle.mainBundle().URLForResource("MAP3", withExtension: "pdf", subdirectory:"Floorplans")!
		
		hcmap = FloorplanOverlay(floorplanUrl: pdfUrl, withPDFBox: CGPDFBox.TrimBox, andAnchors: anchorPair, forFloorLevel: 0)
		
		visibleMapRegionDelegate = VisibleMapRegionDelegate(floorplanBounds: hcmap.boundingMapRectIncludingRotations, boundingPDFBox: hcmap.floorplanPDFBox, floorplanCenter: hcmap.coordinate, floorplanUprightMKMapCameraHeading: hcmap.getFloorplanUprightMKMapCameraHeading())
		
		// === Initialize our view
		hideBackgroundOverlayAlpha = 1.0
		
		// Show the pdf map
		showFloorplan()
		
		/*
		The following are provided for debugging.
		In production, you'll want to comment this out.
		*/
		debuggingAnnotations = ViewController.createDebuggingAnnotationsForMapView(mapView!, aboutFloorplan: hcmap)
	
		// TODO:
		// Recenter??
		
		
	}
	
	
	// LOCATION STUFF
	/*******************************************************/
	/// Respond to CoreLocation updates
	func mapView(mapView: MKMapView, didUpdateUserLocation userLocation: MKUserLocation) {
		let location: CLLocation = userLocation.location!
		var min = CLLocationDistanceMax
		
		// Calculate the closest location to the users location
		for loc in PLACES {
			let tCoord = CLLocation(latitude: loc.coordinates.0, longitude: loc.coordinates.1)
			let temp = location.distanceFromLocation(tCoord)
			if temp < min {
				closestPoint = loc.pointNumber
				min = temp
			}
		}
		
		// Debugging Tool
		// print("Your location is \(location)")
		print("Closest point is \(closestPoint)")
		
		// Now set the origin to be the closest location by default so the
		// next time directions are requested, it's from the current location
		if !changedOrigin {
			originlocation = closestPoint
		}
	}
	
	/// Request authorization if needed.
	func mapViewWillStartLocatingUser(mapView: MKMapView) {
		switch (CLLocationManager.authorizationStatus()) {
		case CLAuthorizationStatus.NotDetermined:
			// Ask the user for permission to use location.
			locationManager.requestWhenInUseAuthorization()
		case CLAuthorizationStatus.Denied:
			NSLog("Please authorize location services for this app under Settings > Privacy")
		case CLAuthorizationStatus.AuthorizedAlways, CLAuthorizationStatus.AuthorizedWhenInUse, CLAuthorizationStatus.Restricted:
			break
			
		}
	}
	/*******************************************************/
	
	// Toggle Map overlay/Satellite overlay
	/*******************************************************/
	/// Helper method that shows the pdf map.
	func showFloorplan() {
		// Hide the satellite imagery
		mapView.addOverlay(HideBackgroundOverlay.hideBackgroundOverlay(), level: .AboveRoads)
		
		// Draw pdf map
		mapView.addOverlay(hcmap)
	}
	
	/// Helper method that hides the pdf map.
	func hideFloorplan() {
		mapView.removeOverlay(hcmap)
	}
	
	/// Helper function that shows the debug visuals.
	func showDebugVisuals() {
		debuggingAnnotations = ViewController.createDebuggingAnnotationsForMapView(mapView!, aboutFloorplan: hcmap)
		hideBackgroundOverlayAlpha = 1.0
		mapView.addAnnotations(debuggingAnnotations)
	}
	
	/// Helper function that hides the debug visuals
	func hideDebugVisuals() {
		mapView.removeAnnotations(debuggingAnnotations)
		hideBackgroundOverlayAlpha = 1.0
	}
	/*******************************************************/
	
	// Line array
	var route: [CLLocation] = []
	var polyline: MKPolyline = MKPolyline()
	
	// This was used from the original code, renders the map.
	/// Produce each type of renderer that might exist in our mapView.
	func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
		
		if (overlay.isKindOfClass(FloorplanOverlay)) {
			let renderer: FloorplanOverlayRenderer = FloorplanOverlayRenderer(overlay: overlay as MKOverlay)
			return renderer
		}
		
		if (overlay.isKindOfClass(HideBackgroundOverlay) == true) {
			
			// This is so the background matches the rest of the application
			let mapGreen = UIColor.init(red: 0.5137, green: 0.7765, blue: 0.4118, alpha: 1.0)
			
			/*
			HideBackgroundOverlay covers the entire world, so this means all
			of MapKit's tiles will be replaced with a solid green background
			*/
			let renderer = MKPolygonRenderer(overlay: overlay as MKOverlay)
			renderer.fillColor = mapGreen.colorWithAlphaComponent(hideBackgroundOverlayAlpha)
			renderer.lineWidth = 0.0
			renderer.strokeColor = mapGreen.colorWithAlphaComponent(0.0)
			
			return renderer
		}
		
		if overlay is MKPolyline {
			let polylineRenderer = MKPolylineRenderer(overlay: overlay)
			polylineRenderer.strokeColor = UIColor.blueColor()
			polylineRenderer.lineWidth = 3
			return polylineRenderer
		}
		
		// Return an error if its not of one of the types
		NSException(name:"InvalidMKOverlay", reason:"Did you add an overlay but forget to provide a matching renderer here? The class was type \(overlay.dynamicType)", userInfo:["wasClass": overlay.dynamicType]).raise()
		return MKOverlayRenderer()
	}
	
	/// Produce each type of annotation view that might exist in our MapView.
	func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
		
		let pinView = MKPinAnnotationView()
		
		// Allow the pin to display its name when it is tapped.
		pinView.canShowCallout = true
		
		// Change the color of the pin depending on its purpose.
		// Make the "Current Location" pin green, and the rest of the pins red.
		if (annotation.title! == "Current Location") {
			return nil // Default to blue dot
		} else {
			// Chose default as red, could be any color
			pinView.pinTintColor = UIColor.redColor()
		}

		// Return the pin
		return pinView
		
	}
	
	/**
	This function creates the pins to be displayed on the map for the locations that need to be passed
	while the user is walking from their origin to destination point.
	This was adapted from the original code sample, but several revisions were made.
	
	- parameter mapView: MapView to draw on.
	- parameter aboutFloorplan: floorplan from which we get anchors and
	coordinates.
	*/
	class func createDebuggingAnnotationsForMapView(mapView: MKMapView, aboutFloorplan floorplan: FloorplanOverlay) -> [MKPointAnnotation] {
		
		var returnArray: Array<MKPointAnnotation>
		returnArray = []
		
		// Create the anchor point pins that can be shown.
		// Drop a red pin on the fromAnchor latitudeLongitude location.
		let fromAnchor = MKPointAnnotation()
		fromAnchor.title = "Anchor 1"
		fromAnchor.coordinate = floorplan.geoAnchorPair.fromAnchor.latitudeLongitudeCoordinate
		// Drop a green pin on the toAnchor latitudeLongitude location.
		let toAnchor = MKPointAnnotation()
		toAnchor.title = "Anchor 2"
		toAnchor.coordinate = floorplan.geoAnchorPair.toAnchor.latitudeLongitudeCoordinate
		
		
		/* Uncomment these two lines to show the anchor points for the map */
		// returnArray.append(fromAnchor)
		// returnArray.append(toAnchor)
		
		// FOR LOOP
		for element in PLACES {
			// Check the PINBOOL array to know if we should display the pins
			if PINBOOL[element.pointNumber] {
				let tempCoord = MKPointAnnotation()
				tempCoord.title = element.name
				tempCoord.coordinate = CLLocationCoordinate2DMake(element.coordinates.0, element.coordinates.1)
				returnArray.append(tempCoord)
			}
		}
		
		return returnArray
	}
	
	// DISTANCE FUNCTIONS
	/*
	These functions below are used to calculate the distances between the points, and ultimately using the Dijkstra
	algorithm find the shortest path from one point to another.
	Any function listed here other than Dijkstra is a helper function that is used to call Dijkstra or used in
	order to get information for the algorithm.
	*/
	/**********************************************************/
	// This function finds the distance from one point to another so that it can be compared for
	// another, possibly shorter, distance from one point.
	func grabDistance(Place: Location, other:Int) -> Double {
		for element in Place.connectedTo {
			if element.otherPoint == other {
				return element.distance
			}
		}
		return 0.0;
	}
	
	// This grabs the location in the array of the next shortest distance from the starting point so that
	// Djikstra can execute
	func getIndexOfMin(dist: Array<Double>, theSet: Set<Int>) -> Int {
		var index = -1
		var min:Double = Double.init(Int.max)
		for item in theSet {
			if dist[item] < min {
				min = dist[item]
				index = item
			}
		}
		return index
	}
	
	// This is the main algorithm for calculating the distance from a point to all of the other points.
	// This code was adapted from the psuedocode on wikipedia: LINK
	func Dijkstra(let Places: Array<Location>, let source:Int) -> (distances: Array<Double>, from: Array<Int>) {
		
		var dist = [Double](count: Places.count, repeatedValue: Double.init(Int.max))
		var prev = [Int](count: Places.count, repeatedValue: -1)
		var Q = Set<Int>()
		
		var i = 0
		while i < Places.count {
			Q.insert(i)
			i = i + 1
		}
		
		dist[source] = 0
		
		while !Q.isEmpty {
			let u = getIndexOfMin(dist, theSet: Q)
			if u == -1 {
				break
			}
			Q.remove(u)
			
			for neighbor in Places[u].connectedTo {
				let alt = dist[u] + grabDistance(Places[u], other: neighbor.otherPoint)
				if alt < dist[neighbor.otherPoint] {
					dist[neighbor.otherPoint] = alt
					prev[neighbor.otherPoint] = u
				}
			}
		}
		
		return (dist, prev)
	}
	
	// This is the function that utilizes the arrays returned by the Djikstra algorithm to find the
	// shortest distance from source to target.
	func GetShortestRoute(let Places: Array<Location>, source: Int, target: Int) -> [Int]{
		let tempTuple = Dijkstra(Places, source: source)
		let p = tempTuple.from
		var S: Array<Int> = [target]
		var u = target
		while p[u] != -1 {
			S.insert(p[u], atIndex: 0)
			u = p[u]
		}
		return S
		
	}
	
	// This function changes the PINBOOL array that tells the application whether or not to display the pin
	// for a given point on the map. Also prints to the debugging window in XCode.
	func PrintSteps(locArray: [Location], src: Int, tar: Int){
		for place in GetShortestRoute(locArray, source: src, target: tar){
			if( place < 57) { PINBOOL[locArray[place].pointNumber] = true }
			let lat = locArray[place].coordinates.0
			let long = locArray[place].coordinates.1
			let temp = CLLocation(latitude: lat, longitude: long)
			route.append(temp)
			print(locArray[place].name)
		}
	}
	/**********************************************************/
	
} // End ViewController Class
