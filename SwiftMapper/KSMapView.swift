//
//  MapView.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import AppKit

class KSMapView: NSView {
	
	var showNodes = false { didSet { needsDisplay = true } }
	
	var map: Map? = nil {
		didSet {
			needsDisplay = true
		}
	}
	
	func mergeData(newMap: Map) {
		if map == nil {
			self.map = newMap
			return
		}
		map?.merge(otherMap: newMap)
	}
	
	override func draw(_ dirtyRect: NSRect) {
		guard let map = map else { return }
		for (_, way) in map.ways {
			NSColor(hue: CGFloat.random(in: 0..<1), saturation: 1, brightness: 1, alpha: 1).setStroke()
			var optionalPath: NSBezierPath? = nil
			for node in way.nodes {
				guard let node = map.nodes[node] else {
					continue
				}
				let point = transformedPoint(lat: CGFloat(node.lat), lon: CGFloat(node.lon))
				guard let path = optionalPath else {
					optionalPath = NSBezierPath()
					optionalPath?.move(to: point)
					optionalPath?.lineWidth = 1;
					continue
				}
				path.line(to: point)
			}
			optionalPath?.stroke()
		}
		if showNodes {
			NSColor.black.setStroke()
			NSColor.white.setFill()
			for (_, node) in map.nodes {
				let point = transformedPoint(lat: CGFloat(node.lat), lon: CGFloat(node.lon))
				let rect = NSMakeRect(point.x-1, point.y-1, 3, 3)
				let path = NSBezierPath.init(ovalIn: rect)
				path.fill()
				path.stroke()
			}
		}
	}
	
	func transformedPoint(lat: CGFloat, lon: CGFloat) -> NSPoint {
		guard let bounds = map?.bounds else {
			return NSPoint(x: 0, y: 0)
		}
		func scaleAndOffset(coordinate: CGFloat, coordinateOffset: CGFloat, unitScale: CGFloat, drawSideLength: CGFloat) -> CGFloat {
			return (((coordinate - coordinateOffset) * unitScale) + 0.5) * drawSideLength
		}
		let result = NSPoint(x: scaleAndOffset(coordinate: lon, coordinateOffset: bounds.midX, unitScale: 1/bounds.width, drawSideLength: visibleRect.width),
							 y: scaleAndOffset(coordinate: lat, coordinateOffset: bounds.midY, unitScale: 1/bounds.height, drawSideLength: visibleRect.height))
		return result
	}
}
