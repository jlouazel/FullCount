//
//  AddPlayerViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 14/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class AddPlayerViewController: UIViewController {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()

	
	@IBOutlet weak var playerNameLabel: UITextField!
	var user: User!
	var roster: [User]!
	
	@IBOutlet weak var teamListTableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
		roster = user.team?.roster!
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
	@IBAction func addPlayer(sender: AnyObject) {
		var newUser = User()
		
		newUser.name = playerNameLabel.text
		user.team!.roster!.append(newUser)
	
		let encodedObj = NSKeyedArchiver.archivedDataWithRootObject(user)
		self.prefs.setObject(encodedObj, forKey: "user")
		
		self.performSegueWithIdentifier("go_back", sender: self)
	}
}
