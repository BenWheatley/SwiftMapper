//
//  SwiftMapperTests.swift
//  SwiftMapperTests
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import XCTest
@testable import SwiftMapper

class SwiftMapperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
		MapXMLParser.loadMap(fileName: "test-empty") { map in
			XCTAssertEqual(map.nodes.count, 0)
			XCTAssertEqual(map.ways.count, 0)
		}
		MapXMLParser.loadMap(fileName: "test-1-node-1-way") { map in
			XCTAssertEqual(map.nodes.count, 1)
			XCTAssertEqual(map.ways.count, 1)
			XCTAssertEqual(map.calculateBounds(), NSRect(x: 52.5031222, y: 13.4731938, width: 0, height: 0))
		}
    }

}
