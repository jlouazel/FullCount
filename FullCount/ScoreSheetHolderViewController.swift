//
//  ScoreSheetHolderViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 13/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class ScoreSheetHolderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	
	var pageIndex: Int!
	var user: User!
	var roster: [User]!
	
	@IBOutlet weak var scoreTableView: UITableView!
	@IBOutlet weak var pageNameLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		pageNameLabel.text = "ROUND \(pageIndex + 1)"
		
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
		return roster.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("sheetTableViewCell") as! SheetTableViewCell

		cell.userNameLabel.text = roster[indexPath.row].name
		
		return cell
	}
	
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
	}
}