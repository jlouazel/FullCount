//
//  User.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import Foundation
import ObjectMapper

class Team: NSObject, NSCoding, Mappable {
	var city: String?
	var name: String?
	
	override init() {}
	
	required init?(_ map: Map) {
		super.init()
		mapping(map)
	}
	
	required init(coder aDecoder: NSCoder) {
		self.city  = aDecoder.decodeObjectForKey("city") as? String
		self.name  = aDecoder.decodeObjectForKey("name") as? String
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(self.city, forKey: "city")
		aCoder.encodeObject(self.name, forKey: "name")
	}
	
	func mapping(map: Map) {
		city <- map["city"]
		name <- map["name"]
	}
}

class User: NSObject, NSCoding, Mappable {
	var username: String?
	var team: Team?
	var games: NSArray = NSArray()
	var favorites: [User]?
	
	override init() {}
	
    required init?(_ map: Map) {
		super.init()
		mapping(map)
    }
	
	required init(coder aDecoder: NSCoder) {
		self.username  = aDecoder.decodeObjectForKey("username") as? String
		self.team = aDecoder.decodeObjectForKey("team") as? Team
		self.games = aDecoder.decodeObjectForKey("team.games") as! NSArray
		self.favorites = aDecoder.decodeObjectForKey("favorites") as? [User]
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(self.username, forKey: "username")
		aCoder.encodeObject(self.team, forKey: "team")
		aCoder.encodeObject(self.games, forKey: "team.games")
		aCoder.encodeObject(self.favorites, forKey: "favorites")
	}
	
	func mapping(map: Map) {
		username    <- map["username"]
		team		<- map["team"]
		favorites	<- map["favorites"]
		games		<- map["team.games"]
	}
	
}