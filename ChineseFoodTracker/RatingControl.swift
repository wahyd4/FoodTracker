//
//  RatingControl.swift
//  ChineseFoodTracker
//
//  Created by Junv on 6/29/15.
//  Copyright © 2015 goldendata. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //MARK: initializaion
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        button.backgroundColor = UIColor.redColor()
        button.addTarget(self, action: "ratingButtonTapped", forControlEvents: .TouchDown)
        addSubview(button)
    }
    
    //MARK: button action
    func ratingButtonTapped(button: UIButton){
        print("button pressed")
        
    }
}
