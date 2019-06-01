//
//  MapNode.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Foundation

class MapNode: MapElement {
	let lat: Double
	let lon: Double
	
	init(id: Int, lat: Double, lon: Double) {
		self.lat = lat
		self.lon = lon
		super.init(id: id)
	}
}
