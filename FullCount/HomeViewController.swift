//
//  HomeController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 09/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()

	
	@IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var menuButton: UIBarButtonItem!
	@IBOutlet weak var teamName: UILabel!
	@IBOutlet weak var cityName: UILabel!

	
	@IBOutlet weak var scoresTableView: UITableView!
	@IBOutlet weak var profileImage: UIImageView!
	
	var user: User!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		scoresTableView.delegate = self
		scoresTableView.dataSource = self

		
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
		
		teamName.text = user.team?.name?.uppercaseString
		cityName.text = user.team?.city?.uppercaseString
		
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
		
		usernameLabel.text = user.username
		
		profileImage.layer.borderWidth = 1
		profileImage.layer.masksToBounds = false
		profileImage.layer.borderColor = UIColor.blackColor().CGColor
		profileImage.layer.cornerRadius = profileImage.frame.height/2.7
		profileImage.clipsToBounds = true
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
	
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return user.games.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = self.scoresTableView.dequeueReusableCellWithIdentifier("ScoresTableViewCell") as! ScoresTableViewCell

		var teamScore: Int = user.games[indexPath.row]["teamScore"] as! Int
		var opponentScore: Int = user.games[indexPath.row]["opponentScore"] as! Int
		
		cell.teamScoreLabel.text = "\(teamScore)"
		cell.teamNameLabel.text = user.team?.name
		cell.opponentNameLabel.text = user.games[indexPath.row]["opponent"] as? String
		cell.opponentScoreLabel.text = "\(opponentScore)"
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
}