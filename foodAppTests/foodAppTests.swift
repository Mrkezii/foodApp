//
//  foodAppTests.swift
//  foodAppTests
//
//  Created by David Kezi on 05/04/2020.
//  Copyright © 2020 David Kezi. All rights reserved.
//

import XCTest
@testable import foodApp

class foodAppTests: XCTestCase {

    //MARK: Meal Class Test
    
    // COnfirm that the meal initialization returns a Meal object when passed valid parameters
    func testMealInitializationSucceeds(){
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // Highest possible rating
        let positiveRatingMeal = Meal.init(name: "positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    func testMealInitializationFails() {
        // empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
        // negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -4)
        XCTAssertNil(negativeRatingMeal)
        
        //Rating Exceeds maximum
        let largeRatingMeal = Meal.init(name: "max", photo: nil, rating: 9)
        XCTAssertNil(largeRatingMeal)
    }

}
