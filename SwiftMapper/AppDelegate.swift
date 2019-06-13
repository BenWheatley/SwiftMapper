//
//  AppDelegate.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
	
	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	func completionBlockGenerator(files: String..., showNodes: Bool = true) -> (MapperViewController)->Void {
		return { mapperViewController in
			
			for file in files {
				MapXMLParser.loadMap(fileName: file) { map in
					mapperViewController.map.mergeData(newMap: map)
				}
			}
			mapperViewController.map.showNodes = showNodes
			
		}
	}
	
	@IBAction func openNewWindow(sender: NSMenuItem) {
		let completionBlock: (MapperViewController)->Void
		switch sender.title {
		case "Berlin public transit":
			completionBlock = completionBlockGenerator(files: "railway-data-berlin-xapi", "public-transport-data-berlin-xapi",
													   showNodes: false)
		case "Berlin historical":
			completionBlock = completionBlockGenerator(files: "historican-nodes-in-berlin-ish-xapi")
		case "Mexico historical":
			completionBlock = completionBlockGenerator(files: "historican-nodes-in-mexico-ish-xapi")
		case "Athens area amenities":
			completionBlock = completionBlockGenerator(files: "amenities-in-athens-ish-xapi")
		case "Athens center amenities":
			completionBlock = completionBlockGenerator(files: "amenities-in-central-athens-xapi")
		default:
			completionBlock = { mapperViewController in }
		}
		
		let mainStoryBoard = NSStoryboard(name: "Main", bundle: nil)
		guard let windowController = mainStoryBoard.instantiateController(withIdentifier: "Mapper") as? NSWindowController else {
			return
		}
		guard let mapperViewController = windowController.window!.contentViewController as? MapperViewController else {
			return
		}
		
		mapperViewController.setupCallback = completionBlock
		
		windowController.showWindow(self)
		
	}
	
}

