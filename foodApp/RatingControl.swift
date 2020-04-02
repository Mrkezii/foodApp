//
//  RatingControl.swift
//  foodApp
//
//  Created by David Kezi on 31/03/2020.
//  Copyright © 2020 David Kezi. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: properties
    private var ratingButtons = [UIButton]()
    
    var rating = 0 {
        didSet {
            updateButtonSelectedStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        // this adds a property observer to be called each time a propertys value is set so that we can update it from the storyboard
        didSet {
            setupButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }
    
    // MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    @objc func ratingButtonTapped(button: UIButton){
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        
        // calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0
            rating = 0
        } else {
            // set the rating to the selected star
            rating = selectedRating
        }
    }
    
    //MARK: Private methods
    private func setupButtons() {
        // load button images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
         
        for _ in 0..<starCount {
            // create the buttons
            let button = UIButton()
            
            // set the button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
//            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // add the button to the rating button array
            ratingButtons.append(button)
            
        }
        
        updateButtonSelectedStates()
        
    }
    var count = 1
    private func updateButtonSelectedStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected
            button.isSelected = index < rating
            print(button.isSelected, count)
            count = count + 1
        }
    }
}
