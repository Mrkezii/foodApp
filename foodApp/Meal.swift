//
//  Meal.swift
//  foodApp
//
//  Created by David Kezi on 05/04/2020.
//  Copyright © 2020 David Kezi. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        
        // name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // rating must not be between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialise stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        
    }
}
