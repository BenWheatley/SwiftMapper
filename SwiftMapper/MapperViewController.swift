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
	var setupCallback: ((MapperViewController)->Void)?
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear() {
		super.viewDidAppear()
		
		if let callback = setupCallback {
			callback(self)
		}
	}
	
	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}


}

