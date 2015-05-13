//
//  GameCreationViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class GameCreationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	
	var roster: [User]!
	
	@IBOutlet weak var gameCreationTableView: UITableView!
	@IBOutlet weak var menuButton: UIBarButtonItem!
	var user: User!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		self.gameCreationTableView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: "longPressGestureRecognized:"))
		
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
		
		roster = user.team!.roster!
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return user.team!.roster!.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = self.gameCreationTableView.dequeueReusableCellWithIdentifier("GameCreationTableViewCell") as! GameCreationTableViewCell
		
		if  indexPath.row >= 9 {
			cell.contentView.backgroundColor = UIColor.lightGrayColor()
			cell.userNameLabel.textColor = UIColor.whiteColor()
		} else {
			cell.contentView.backgroundColor = UIColor.whiteColor()
			cell.userNameLabel.textColor = UIColor.blackColor()
		}
		cell.userNameLabel.text = user.team?.roster?[indexPath.row].name
		return cell
	}
	
	func longPressGestureRecognized(gestureRecognizer: UIGestureRecognizer) {
		let longPress = gestureRecognizer as! UILongPressGestureRecognizer
		
		let state = longPress.state
		
		var locationInView = longPress.locationInView(self.gameCreationTableView)
		
		var indexPath = self.gameCreationTableView.indexPathForRowAtPoint(locationInView)
		
		struct My {
			
			static var cellSnapshot : UIView? = nil
			
		}
		struct Path {
			
			static var initialIndexPath : NSIndexPath? = nil
			
		}
		
		switch state {
		case UIGestureRecognizerState.Began:
			if indexPath != nil {
				Path.initialIndexPath = indexPath
				let cell = self.gameCreationTableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!
				My.cellSnapshot  = snapshopOfCell(cell)
				var center = cell.center
				
				My.cellSnapshot!.center = center
				
				My.cellSnapshot!.alpha = 0.0
				
				self.gameCreationTableView.addSubview(My.cellSnapshot!)
				
				UIView.animateWithDuration(0.25, animations: { () -> Void in
					center.y = locationInView.y
					
					My.cellSnapshot!.center = center
					
					My.cellSnapshot!.transform = CGAffineTransformMakeScale(1.05, 1.05)
					
					My.cellSnapshot!.alpha = 0.98
					
					cell.alpha = 0.0
					
					}, completion: { (finished) -> Void in
						
						if finished {
							
							cell.hidden = true
							
						}
						
				})
				
			}
		case UIGestureRecognizerState.Changed:
			var center = My.cellSnapshot!.center
			center.y = locationInView.y
			My.cellSnapshot!.center = center
			if ((indexPath != nil) && (indexPath != Path.initialIndexPath)) {
				swap(&roster[indexPath!.row], &roster[Path.initialIndexPath!.row])
				self.gameCreationTableView.moveRowAtIndexPath(Path.initialIndexPath!, toIndexPath: indexPath!)
				Path.initialIndexPath = indexPath
			}
		default:
			let cell = self.gameCreationTableView.cellForRowAtIndexPath(Path.initialIndexPath!) as UITableViewCell!
			cell.hidden = false
			cell.alpha = 0.0
			UIView.animateWithDuration(0.25, animations: { () -> Void in
				My.cellSnapshot!.center = cell.center
				My.cellSnapshot!.transform = CGAffineTransformIdentity
				My.cellSnapshot!.alpha = 0.0
				cell.alpha = 1.0
				}, completion: { (finished) -> Void in
					if finished {
						Path.initialIndexPath = nil
						My.cellSnapshot!.removeFromSuperview()
						My.cellSnapshot = nil
					}
			})
		}
	}
	
	func snapshopOfCell(inputView: UIView) -> UIView {
		UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
		inputView.layer.renderInContext(UIGraphicsGetCurrentContext())
		let image = UIGraphicsGetImageFromCurrentImageContext() as UIImage
		UIGraphicsEndImageContext()
		let cellSnapshot : UIView = UIImageView(image: image)
		cellSnapshot.layer.masksToBounds = false
		cellSnapshot.layer.cornerRadius = 0.0
		cellSnapshot.layer.shadowOffset = CGSizeMake(-5.0, 0.0)
		cellSnapshot.layer.shadowRadius = 5.0
		cellSnapshot.layer.shadowOpacity = 0.4
		return cellSnapshot
	}
}