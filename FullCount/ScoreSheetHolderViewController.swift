//
//  ScoreSheetHolderViewController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 13/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class ScoreSheetHolderViewController: UIViewController {

	var pageIndex: Int!
	
	@IBOutlet weak var testLabel: UILabel!
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(true)
	}
}