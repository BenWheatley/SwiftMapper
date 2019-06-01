//
//  Dictionary+Extension.swift
//  SwiftMapper
//
//  Created by Ben Wheatley on 2019/06/01.
//  Copyright © 2019 Ben Wheatley. All rights reserved.
//

import Foundation

extension Dictionary {
	mutating func merge(dict: [Key: Value]){
		for (k, v) in dict {
			self[k] = v
		}
	}
}
