//
//  ViewController.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Cocoa

class MapperViewController: NSViewController {
	
	@IBOutlet var map: KSMapView!
	
	var parser: MapXMLParser? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear() {
		super.viewDidAppear()
		
		guard let path = Bundle.main.path(forResource: "public-transport-data-berlin-xapi", ofType: "xml") else {
			print("fail")
			return
		}
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path))
			parser = MapXMLParser(xml: data) { map in
				self.map.map = map
				self.parser = nil
			}
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

