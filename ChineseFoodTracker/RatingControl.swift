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

    //MARK: initializaion
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in  1...5 {
            let button = UIButton()
            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)

        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        
    }
    
    //MARK: button action
    func ratingButtonTapped(button: UIButton){
        print("button pressed 🎃😀")
        
    }
}
