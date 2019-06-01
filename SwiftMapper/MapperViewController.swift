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
		
		loadMap(fileName: "railway-data-berlin-xapi") { map in
			self.map1.mergeData(newMap: map)
		}
		loadMap(fileName: "public-transport-data-berlin-xapi") { map in
			self.map1.mergeData(newMap: map)
		}
	}
	
	func loadMap(fileName: String, map: Map = Map(), completionHandler: @escaping (Map) -> Void) {
		guard let path = Bundle.main.path(forResource: fileName, ofType: "xml") else {
			print("fail")
			return
		}
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path))
			_ = MapXMLParser(xml: data, map: map, completionHandler: completionHandler)
		} catch {
			print("error")
		}
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

