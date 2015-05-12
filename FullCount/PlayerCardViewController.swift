//
//  PlayerCardViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class PlayerCardViewController: UIViewController {
	@IBOutlet weak var menuButton: UIBarButtonItem!
	
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var teamNameLabel: UILabel!
	
	var user: User!
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
		
		let usDateFormat = NSDateFormatter.dateFormatFromTemplate("MMddyyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))

		var dateFormatter = NSDateFormatter()
		dateFormatter.dateFormat = "MMMM d, YYYY"
		let d = NSDate()
		
		userNameLabel.text = user.username?.uppercaseString
		teamNameLabel.text = user.team?.name?.uppercaseString
		
		dateLabel.text = dateFormatter.stringFromDate(d).uppercaseString
		dateLabel.text?.uppercaseString
		
		userNameLabel.transform = CGAffineTransformMakeRotation (3.14/0.518)
		dateLabel.transform = CGAffineTransformMakeRotation (3.14/0.518)
		teamNameLabel.transform = CGAffineTransformMakeRotation (3.14/0.52)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
}
