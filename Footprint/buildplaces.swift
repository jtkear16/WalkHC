//
//  buildplaces.swift
//  
//  JT, Matt, Abby
//
//

import Foundation

// Constants
let PI = 3.14159

// Structs
struct Location {
	var pointNumber: Int = 0
	var name: String = ""
	var coordinates: (Double, Double) = (0, 0) // (Lat, Long)
	var connectedTo = [Connection]() // An array of connections
}

struct Connection {
	var otherPoint = 0; // The number of the point it connects to
	var distance: Double = 0.0 // in miles
}

/************************************************/
/* Start the functions necessary for the script */
/************************************************/

// Calculates the distance between two geographic points 
// http://stackoverflow.com/questions/27928/calculate-distance-between-two-latitude-longitude-points-haversine-formula/27943#27943
func CalculateDistance (loc1: Location, loc2:Location) -> Double{
	let R = 3963.1906 // Radius of the Earth in miles
	let dLat = (loc2.coordinates.0 - loc1.coordinates.0)*PI/180
	let dLon = (loc2.coordinates.1 - loc1.coordinates.1)*PI/180
	let lat1 = loc1.coordinates.0*PI/180
	let lat2 = loc2.coordinates.0*PI/180
	
	let a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1) * cos(lat2)
	let c = 2 * atan2(sqrt(a), sqrt(1-a))
	let d = R * c // this is in miles
	
	return d;
}

// Makes a connection between two places, but only adds the connection for loc1 so that each
// point has to call this function. This allos for one way connections.
func MakeConnection (inout loc1: Location, loc2:Location){
	var newConnection = Connection(otherPoint: 0, distance: CalculateDistance(loc1, loc2: loc2))
	newConnection.otherPoint = loc2.pointNumber
	loc1.connectedTo.append(newConnection)
}

// From http://stackoverflow.com/questions/24004776/input-from-the-keyboard-in-command-line-application
// This function handles keyboard input from the user.
func input() -> String {
	let keyboard = NSFileHandle.fileHandleWithStandardInput()
	let inputData = keyboard.availableData
	return NSString(data: inputData, encoding:NSUTF8StringEncoding) as! String
}

// http://www.dotnetperls.com/file-swift
// The next function was found at the above link and modified to read in for our file.
func ReadFile(path:String) -> String {
	let data = ""
	do {
		let data = try NSString(contentsOfFile: path, encoding: NSASCIIStringEncoding)
		
		// return the string from the file
		return data as String
	} catch {
		print ("Error reading from file")
	}
	return data
}

// Creates a location from the string ready in from the .tsv file.
// Initialized with an empty connections array to be edited later.
func MakeLocation(rawLocation:String) -> Location{
	let newList = rawLocation.characters.split{$0 == "\t"}.map(String.init)
	let coord = newList[1].characters.split{$0 == ","}.map(String.init)
	let num: Int = Int(newList[0])!
	let lat: Double = Double(coord[0])!
	let long: Double = Double(coord[1])!
	let empty = [Connection]()
	return Location(pointNumber: num, name:newList[2], coordinates: (lat, long), connectedTo: empty)
}

// Adds the connections for a location based on the file.
func AddConnections(rawLocation:String, inout locationArray: Array<Location>){
	var newList = rawLocation.characters.split{$0 == "\t"}.map(String.init)
	newList.removeAtIndex(2)
	newList.removeAtIndex(1)
	let currentIndex: Int = Int(newList[0])!
	newList.removeAtIndex(0)
	for element in newList{
		MakeConnection(&locationArray[currentIndex], loc2: locationArray[Int(element)!])
	}
}

// Builds and returns an array of locations.
func BuildLocations() -> Array<Location> {
	
	var Places = [Location]()
	
	// Read in the whole file
	let documentString = ReadFile("places.tsv")
	let stringList = documentString.characters.split{$0 == "\r\n"}.map(String.init);
	
	// Add the Places
	for element in stringList {
		let tempLocation:Location = MakeLocation(element)
		Places.append(tempLocation)
	}
	
	// Now add the Connections
	for element in stringList {
		AddConnections(element, locationArray: &Places)
	}
	
	return Places
	
}

/************************************************/
/*********************SCRIPT*********************/
/************************************************/

// Prints the header information to the screen 
print("/*\nFileaname: Places.swift")
print("Names: Matt Gigliotti, JT Kearney, Abigail Oliver")
print("Class: Programming Languages, Final Project")
print("Professor: Laurie King")
print("Abstract:")
print("The core data structures which the application is built on.")
print("*/")

// Prints the structs to the screen
print("/*\nThese are the structs that make the locations\n*/")
print("struct Location {")
print("var pointNumber = 0")
print("var name = \"\"")
print("var coordinates: (Double, Double) = (0, 0) // (Lat, Long)")
print("var connectedTo = [Connection]() // An array of connections")
print("}")
print("struct Connection {")
print("var otherPoint = 0; // The number of the point it connects to")
print("var distance: Double = 0.0 // in miles")
print("}")

// Builds and prints the PLACES array to the screen
var Places: Array<Location> = BuildLocations()
print("/*\nThis is the hard coded locations array. Reading from a file proved difficult so we wrote a small swift script to generate this file.\n*/")
print("let PLACES = [")
for element in Places {
	print("Location( pointNumber:\(element.pointNumber), name:\"\(element.name)\", coordinates: \(element.coordinates), connectedTo:[")
	for connection in element.connectedTo {
		print("Connection(otherPoint:\(connection.otherPoint), distance:\(connection.distance)), ")
	}
	print("]),")
}
print("]")

// Prints the initialized PINBOOL array to the screen
print("/*\nThe initial Boolean array that tells the program whether or not to display pins\n*/")
print("var PINBOOL = [Bool](count: PLACES.count, repeatedValue: false)")

// Builds and prints the sorted NAMEARRAY to the screen
var NAMEARRAY = [String]()
for element in Places {
	NAMEARRAY.append(element.name)
}
NAMEARRAY = NAMEARRAY.sort()
print("/*\nThe first of two parallel arrays so that the picker is in alphabetical order.\n*/")
print("let NAMEARRAY = [")
for element in NAMEARRAY {
	print("\"\(element)\",")
}
print("]")
print("/** unicode data found at : http://unicode.org/emoji/charts/full-emoji-list.html#1f371 */")


// Builds and prints the NUMBERPARALLEL array to the screen
var NUMBERPARALLEL = [Int]()
print("/*\nThe second parallel array that gives the number of the point for the place selected in the picker.\n*/")
func findCorrespondingNumber(let places: [Location], s:String) -> Int{
	for element in places {
		if element.name == s {
			return element.pointNumber
		}
	}
	return 0
}
for element in NAMEARRAY {
	NUMBERPARALLEL.append(findCorrespondingNumber(Places, s: element))
}
print("let NUMBERPARALLEL = [")
for element in NUMBERPARALLEL {
	print("\(element),")
}
print("]")

