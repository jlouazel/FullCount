//
//  MenuController.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 09/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class MenuController: UIViewController  {
	let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()

	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var usernameLabel: UILabel!
	override func viewDidLoad() {
        super.viewDidLoad()

		var data = self.prefs.dataForKey("user")!
		var user = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? User
		
		usernameLabel.text = user?.username
		
		profileImage.layer.borderWidth = 1
		profileImage.layer.masksToBounds = true
		profileImage.layer.borderColor = UIColor.blackColor().CGColor
		profileImage.layer.cornerRadius = profileImage.frame.height/2.9
		profileImage.clipsToBounds = true
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}