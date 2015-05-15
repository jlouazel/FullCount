//
//  ViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 09/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController, FBLoginViewDelegate {
	@IBOutlet weak var fbLoginView: FBLoginView!
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		fbLoginView.delegate = self
		fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
		
	}
	
	func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
		println("User Logged In")
	}
	
	func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
//		Alamofire.request(.POST, "http://fullcountserver.herokuapp.com/api/users/login/facebook", parameters: ["token": FBSession.activeSession().accessTokenData.description], encoding: .JSON)
//			.responseJSON { (request, response, json, error) in
//				println(response)
//				if (error != nil) {
//					println("Error: \(error)")
//				} else {
//					println(json)
//					
//					var user: User! = Mapper<User>().map(json)
//					
//					if (user.username != nil) {
//						let encodedObj = NSKeyedArchiver.archivedDataWithRootObject(user)
//						self.prefs.setObject(encodedObj, forKey: "user")
//						
//						self.performSegueWithIdentifier("goto_home_facebook", sender: self)
//					}
//				}
//		}
	}
	
	func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
		println("User Logged Out")
	}
	
	func loginView(loginView : FBLoginView!, handleError:NSError) {
		println("Error: \(handleError.localizedDescription)")
	}
	
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}