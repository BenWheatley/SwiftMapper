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
	
	@IBAction func openNewWindow(sender: NSMenuItem) {
		let completionBlock: (MapperViewController)->Void
		switch sender.title {
		case "Berlin public transit":
			completionBlock = { mapperViewController in
				
				MapXMLParser.loadMap(fileName: "railway-data-berlin-xapi") { map in
					mapperViewController.map.mergeData(newMap: map)
				}
				MapXMLParser.loadMap(fileName: "public-transport-data-berlin-xapi") { map in
					mapperViewController.map.mergeData(newMap: map)
				}
				
			}
		case "Berlin historical":
			completionBlock = { mapperViewController in
				
				MapXMLParser.loadMap(fileName: "historican-nodes-in-berlin-ish-xapi") { map in
					mapperViewController.map.mergeData(newMap: map)
				}
				mapperViewController.map.showNodes = true
				
			}
		case "Mexico historical":
			completionBlock = { mapperViewController in
				
				MapXMLParser.loadMap(fileName: "historican-nodes-in-mexico-ish-xapi") { map in
					mapperViewController.map.mergeData(newMap: map)
				}
				mapperViewController.map.showNodes = true
				
			}
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

