//
//  FavoritesViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
	
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
	var user: User!
	
	var favoritesItems: NSMutableArray! = NSMutableArray()
	
	@IBOutlet weak var menuButton: UIBarButtonItem!
	
	@IBOutlet weak var favoritesCollectionView: UICollectionView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
		var data = self.prefs.dataForKey("user")!
		user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
	
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return user.favorites!.count
	}
 
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FavoritesCollectionViewCell", forIndexPath: indexPath) as! FavoritesCollectionViewCell
		
		cell.userNameLabel.text = user.favorites?[indexPath.row].username
		return cell
	}
}
