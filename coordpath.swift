//
//  coordpath.swift
//  
//  JT, Matt, Abby
//
//

import Foundation
let PI = 3.14159

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

// TODO: Find function again on stackoverflow
func CalculateDistance (loc1: Location, loc2:Location) -> Double{
	let R = 3963.1906 // Radius of the Earth in miles
	let dLat = (loc2.coordinates.0 - loc1.coordinates.0)*PI/180
	let dLon = (loc2.coordinates.1 - loc1.coordinates.1)*PI/180
	let lat1 = loc1.coordinates.0*PI/180
	let lat2 = loc2.coordinates.0*PI/180
	
	let a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1) * cos(lat2)
	let c = 2 * atan2(sqrt(a), sqrt(1-a))
	let d = R * c // multiply by 5280 to get in feet
	
	return d;
}

// Makes a connection between two places, allows for one way connections
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
// The next two functions were found and modified from the above link to
// read and write to/from files
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

func WriteFile(path:String, toWrite:String){
	
	// Write the text to the path.
	do{
		try toWrite.writeToFile(path,
			atomically: true,
			encoding: NSASCIIStringEncoding)
		print("Successfully written to the file \(path).")
	}
	catch{
		print("Failed to write to \(path).")
	}
}

/***********************/
// Makes a location
func MakeLocation(rawLocation:String) -> Location{
	let newList = rawLocation.characters.split{$0 == "\t"}.map(String.init)
	let coord = newList[1].characters.split{$0 == ","}.map(String.init)
	let num: Int = Int(newList[0])!
	let lat: Double = Double(coord[0])!
	let long: Double = Double(coord[1])!
	let empty = [Connection]()
	return Location(pointNumber: num, name:newList[2], coordinates: (lat, long), connectedTo: empty)
}

// Adds connections for a line from the file
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

/***********************/


func grabDistance(Place: Location, other:Int) -> Double {
	for element in Place.connectedTo {
		if element.otherPoint == other {
			return element.distance
		}
	}
	return 0.0;
}

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

func Dijkstra(let Places: Array<Location>, let source:Int) -> (distances: Array<Double>, from: Array<Int>) {
	
	// “var threeDoubles = [Double](count: 3, repeatedValue: 0.0)”
	// Excerpt From: Apple Inc. “The Swift Programming Language (Swift 2.2).” iBooks.
	var dist = [Double](count: Places.count, repeatedValue: Double.init(Int.max))
	var prev = [Int](count: Places.count, repeatedValue: -1)
	var Q = Set<Int>()
	
	var i = 0
	while i < Places.count {
		Q.insert(i)
		i++
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

func PrintSteps(locArray: [Location], src: Int, tar: Int){
	print("\(locArray[src].name) -> \(locArray[tar].name)")
	for place in GetShortestRoute(locArray, source: src, target: tar){
		// Change the boolean of the pin to true
		print(locArray[place].name)
	}
	print("")
}

/***********************/

func BuildLocations() -> Array<Location> {
	
	var Places = [Location]()
	
	// Read in the whole file
	let documentString = ReadFile("places.tsv")
	let stringList = documentString.characters.split{$0 == "\r\n"}.map(String.init);
	for element in stringList {
		let tempLocation:Location = MakeLocation(element)
		Places.append(tempLocation)
	}
	
	// Add Connections
	for element in stringList {
		AddConnections(element, locationArray: &Places)
	}
	
	return Places
	
}

var Places: Array<Location> = BuildLocations()
var i = 0;
while i < Places.count {
	var j = 0;
	while j < Places.count {
		if (i != j) {
			PrintSteps(Places, src: i, tar: j)
		}
		j = j + 1
	}
	i = i + 1
}
