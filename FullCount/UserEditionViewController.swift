//
//  UserEditionViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 14/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class UserEditionViewController: UIViewController {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	var user: User!

	@IBOutlet weak var userNameLabel: UITextField!
	@IBOutlet weak var cityLabel: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
		
		userNameLabel.text = user.username
		cityLabel.text = user.team?.city
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	@IBAction func save(sender: AnyObject) {
		user.username = userNameLabel.text
		user.team?.city = cityLabel.text
		
		let encodedObj = NSKeyedArchiver.archivedDataWithRootObject(user)
		self.prefs.setObject(encodedObj, forKey: "user")
		
		// Request API
	}
}