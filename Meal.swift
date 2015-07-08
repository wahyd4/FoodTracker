//
//  Meal.swift
//  ChineseFoodTracker
//
//  Created by Junv on 7/1/15.
//  Copyright © 2015 goldendata. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: properties
    var name: String
    var rating: Int
    var photo: UIImage?
    
    //MARK: initialization
    init?(name: String, rating: Int, photo: UIImage?){
        self.name = name
        self.rating = rating
        self.photo = photo
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}


