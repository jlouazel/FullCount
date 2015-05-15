//
//  SignupViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 14/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class SignupViewController: UIViewController {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	
	var user: User!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var userNameLabel: UITextField!
	@IBOutlet weak var emailLabel: UITextField!
	@IBOutlet weak var passwordLabel: UITextField!
	@IBOutlet weak var teamListTableView: UITableView!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		activityIndicator.hidesWhenStopped = true
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
	}
	
	@IBAction func signup(sender: AnyObject) {
		activityIndicator.startAnimating()
		Alamofire.request(.POST, "http://fullcountserver.herokuapp.com/api/users", parameters: ["email": emailLabel.text, "password": passwordLabel.text, "username": userNameLabel.text], encoding: .JSON)
			.responseJSON { (request, response, json, error) in
				if (error != nil) {
					println("Error: \(error)")
				} else {
					var user: User! = Mapper<User>().map(json)
					self.activityIndicator.stopAnimating()
					
					let encodedObj = NSKeyedArchiver.archivedDataWithRootObject(user)
					self.prefs.setObject(encodedObj, forKey: "user")
					
					self.performSegueWithIdentifier("goto_home2", sender: self)
					
				}
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
	
}
