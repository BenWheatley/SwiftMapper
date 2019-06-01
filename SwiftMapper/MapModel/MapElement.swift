//
//  MapElement.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Foundation

class MapElement {
	/// Type is for compactness only; this could be a String to reduce parsing complexity
	let id: Int
	var tags: [String:String] = [:]
	
	init(id: Int) {
		self.id = id
	}
}
