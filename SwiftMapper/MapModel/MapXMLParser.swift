//
//  MapXMLParser.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Foundation

class MapXMLParser: NSObject, XMLParserDelegate {
	var parser: XMLParser
	var map: Map
	var currentElement: MapElement?
	
	var completionHandler: (Map) -> Void
	
	init(xml: Data, completionHandler: @escaping (Map) -> Void) {
		self.completionHandler = completionHandler;
		map = Map()
		
		parser = XMLParser(data: xml)
		super.init()
		
		parser.delegate = self
		parser.parse()
	}
	
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
		switch elementName {
		case "node":
			if let idString = attributeDict["id"],
				let id = Int(idString),
				let latString = attributeDict["lat"],
				let lat = Double(latString),
				let lonString = attributeDict["lon"],
				let lon = Double(lonString) {
				
				let node = MapNode(id: id, lat: lat, lon: lon)
				map.nodes[id] = node
				currentElement = node
			}
		case "way":
			if let idString = attributeDict["id"],
				let id = Int(idString) {
				
				let way = MapWay(id: id)
				map.ways[id] = way
				currentElement = way
			}
		case "nd":
			let currentWay = currentElement as? MapWay
			if currentWay != nil,
				let refString = attributeDict["ref"],
				let ref = Int(refString) {
				
				currentWay?.nodes.append(ref)
			}
		case "tag":
			if let key = attributeDict["k"],
				let value = attributeDict["v"] {
				
				currentElement?.tags[key] = value
			}
		default:
			print("Unrecognised elementName: \(elementName)")
		}
	}
	
	func parserDidEndDocument(_ parser: XMLParser) {
		completionHandler(map)
	}

}
