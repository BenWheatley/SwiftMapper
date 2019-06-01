//
//  Map.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Foundation

extension Dictionary {
	mutating func merge(dict: [Key: Value]){
		for (k, v) in dict {
			self[k] = v
		}
	}
}

struct Map {
	var nodes: [Int: MapNode] = [:]
	var ways: [Int: MapWay] = [:]
	
	mutating func merge(otherMap: Map) {
		nodes.merge(dict: otherMap.nodes)
		ways.merge(dict: otherMap.ways)
		bounds = calculateBounds()
	}
	
	lazy var bounds: NSRect = calculateBounds()
	
	func calculateBounds() -> NSRect {
		var minLat = 1000.0
		var minLon = 1000.0
		var maxLat = -1000.0
		var maxLon = -10000.0
		
		for (_, node) in nodes {
			if node.lat < minLat {
				minLat = node.lat
			}
			if node.lat > maxLat {
				maxLat = node.lat
			}
			if node.lon < minLon {
				minLon = node.lon
			}
			if node.lon > maxLon {
				maxLon = node.lon
			}
		}
		
		return NSRect(x: minLon, y: minLat, width: maxLon-minLon, height: maxLat-minLat)
	}
}
