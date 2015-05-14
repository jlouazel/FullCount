//
//  SheetTableViewCell.swift
//  FullCount
//
//  Created by Jean-Baptiste Louazel on 14/05/2015.
//  Copyright (c) 2015 Jean-Baptiste Louazel. All rights reserved.
//

import UIKit

class SheetTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var FirstBButton: UIButton!
    @IBOutlet weak var SecondBButon: UIButton!
    @IBOutlet weak var ThirdBButton: UIButton!
    @IBOutlet weak var FullBButton: UIButton!
    
    @IBOutlet weak var fieldImage: UIImageView!
    
    var step: Int = 0
    var pageName: String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func toRightStep(_step: Int!) {
        
        if _step == step {
            step--
        } else {
            step = _step
        }
        
        switch step {
        case 0:
            fieldImage.image = UIImage(named: "field")
            FirstBButton.backgroundColor = UIColor.whiteColor()
            SecondBButon.backgroundColor = UIColor.whiteColor()
            ThirdBButton.backgroundColor = UIColor.whiteColor()
            FullBButton.backgroundColor = UIColor.whiteColor()
            break
        case 1:
            fieldImage.image = UIImage(named: "field_first")
            FirstBButton.backgroundColor = UIColor.redColor()
            SecondBButon.backgroundColor = UIColor.whiteColor()
            ThirdBButton.backgroundColor = UIColor.whiteColor()
            FullBButton.backgroundColor = UIColor.whiteColor()
            break
        case 2:
            fieldImage.image = UIImage(named: "field_second")
            FirstBButton.backgroundColor = UIColor.whiteColor()
            SecondBButon.backgroundColor = UIColor.redColor()
            ThirdBButton.backgroundColor = UIColor.whiteColor()
            FullBButton.backgroundColor = UIColor.whiteColor()
            break
        case 3:
            fieldImage.image = UIImage(named: "field_third")
            FirstBButton.backgroundColor = UIColor.whiteColor()
            SecondBButon.backgroundColor = UIColor.whiteColor()
            ThirdBButton.backgroundColor = UIColor.redColor()
            FullBButton.backgroundColor = UIColor.whiteColor()
            break
        case 4:
            fieldImage.image = UIImage(named: "field_home")
            FirstBButton.backgroundColor = UIColor.whiteColor()
            SecondBButon.backgroundColor = UIColor.whiteColor()
            ThirdBButton.backgroundColor = UIColor.whiteColor()
            FullBButton.backgroundColor = UIColor.redColor()
            break
        default:
            fieldImage.image = UIImage(named: "field")
            step = 0
            FirstBButton.backgroundColor = UIColor.whiteColor()
            SecondBButon.backgroundColor = UIColor.whiteColor()
            ThirdBButton.backgroundColor = UIColor.whiteColor()
            FullBButton.backgroundColor = UIColor.whiteColor()
        }
    }
    
    
    @IBAction func toFirstBase(sender: AnyObject) {
        toRightStep(1)
    }
    
    @IBAction func toSecondBase(sender: AnyObject) {
        toRightStep(2)
    }
    
    @IBAction func toThirdBase(sender: AnyObject) {
        
        toRightStep(3)
    }
    
    @IBAction func toFullBase(sender: AnyObject) {
        
        toRightStep(4)
    }
    
}

