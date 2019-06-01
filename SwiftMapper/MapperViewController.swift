//
//  ViewController.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Cocoa

class MapperViewController: NSViewController {
	
	@IBOutlet var map1: KSMapView!
	
//	var parser: MapXMLParser? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear() {
		super.viewDidAppear()
		
		MapXMLParser.loadMap(fileName: "railway-data-berlin-xapi") { map in
			self.map1.mergeData(newMap: map)
		}
		MapXMLParser.loadMap(fileName: "public-transport-data-berlin-xapi") { map in
			self.map1.mergeData(newMap: map)
		}
	}
	
	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

