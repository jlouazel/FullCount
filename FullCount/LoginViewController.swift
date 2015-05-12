//
//  LoginViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 10/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class LoginViewController: UIViewController {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passwordField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}
	
	
	@IBAction func signinTapped(sender: UIButton) {

		Alamofire.request(.POST, "http://fullcountserver.herokuapp.com/api/users/login", parameters: ["email": emailField.text, "password": passwordField.text], encoding: .JSON)
			.responseJSON { (request, response, json, error) in
				if (error != nil) {
					println("Error: \(error)")
				} else {
					println(json)
					
					var user: User! = Mapper<User>().map(json)
					println(user?.username)
					
					let encodedObj = NSKeyedArchiver.archivedDataWithRootObject(user)
					self.prefs.setObject(encodedObj, forKey: "user")
					
					self.performSegueWithIdentifier("goto_home", sender: self)

				}
		}
	}
}
