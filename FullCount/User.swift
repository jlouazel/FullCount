//
//  User.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import Foundation
import ObjectMapper

class User: NSObject, NSCoding, Mappable {
	var username: String?
	
	override init() {}
	
    required init?(_ map: Map) {
//		self.init()
		super.init()
		mapping(map)
    }
	
	required init(coder aDecoder: NSCoder) {
		self.username  = aDecoder.decodeObjectForKey("username") as? String
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(self.username, forKey: "username")
	}
	
	func mapping(map: Map) {
		username    <- map["username"]
	}
	
}