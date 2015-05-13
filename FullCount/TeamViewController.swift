//
//  TeamViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
	@IBOutlet weak var menuButton: UIBarButtonItem!
	var leagueCategories = [
		"High School",
		"Amateur",
		"College",
		"Town Team",
		"Semi-Professional",
		"Professional",
		"Defunct",
		"Other"
	]
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		if self.revealViewController() != nil {
			menuButton.target = self.revealViewController()
			menuButton.action = "revealToggle:"
			self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
	
	func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return leagueCategories.count
	}
	
	func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
		return leagueCategories[row]
	}
}