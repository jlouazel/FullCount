//
//  MenuTableViewCell.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 11/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
	
	@IBOutlet weak var postImageView:UIImageView!
	@IBOutlet weak var authorImageView:UIImageView!
	@IBOutlet weak var postTitleLabel:UILabel!
	@IBOutlet weak var authorLabel:UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}