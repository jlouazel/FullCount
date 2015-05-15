//
//  TeamListViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 14/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class TeamListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
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
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return roster.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("TeamListViewCell") as! TeamListViewCell

		cell.userNameLabel.text = roster[indexPath.row].name
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
	
	func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		return true
	}
	
	func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if (editingStyle == UITableViewCellEditingStyle.Delete) {
			// handle delete (by removing the data from your array and updating the tableview)
			roster.removeAtIndex(indexPath.row)
			
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		}
	}
}
