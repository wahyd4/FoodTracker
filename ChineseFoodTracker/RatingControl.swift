//
//  RatingControl.swift
//  ChineseFoodTracker
//
//  Created by Junv on 6/29/15.
//  Copyright © 2015 goldendata. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: properties
    var rating = 0

    var ratingButtons = [UIButton]()
    var spacing = 5
    var totalStars = 5

    //MARK: initializaion
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let emptyStar = UIImage(named: "emptyStar")
        let filledStar = UIImage(named: "star")
        
        for _ in  1...totalStars {
            let button = UIButton()
            button.setImage(emptyStar, forState: .Normal)
            button.setImage(filledStar, forState: .Selected)
            button.setImage(filledStar, forState: [.Selected, .Highlighted])
            
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)

        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    //MARK: button action
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        print("==========\(rating)")
        for(index, button) in ratingButtons.enumerate() {
            button.selected = index < rating
        }
    }
    
}
