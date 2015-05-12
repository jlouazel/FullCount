//
//  FavoritesCollectionViewCell.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 12/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var favoriteCardImageBorder: UIImageView!
	@IBOutlet weak var userNameLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		
		favoriteCardImageBorder.layer.masksToBounds = false
		favoriteCardImageBorder.layer.cornerRadius = favoriteCardImageBorder.frame.height/15
		favoriteCardImageBorder.clipsToBounds = true
	}
}
