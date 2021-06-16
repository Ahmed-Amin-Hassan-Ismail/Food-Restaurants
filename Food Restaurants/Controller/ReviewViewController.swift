//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Amin  on 11/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var backgroundImageView: UIImageView! {
        didSet {
            backgroundImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet var rateButtons: [UIButton]!
    @IBOutlet weak var closeButton: UIButton!
    
    
    //instance variable
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background image transition
        backgroundImageView.image = UIImage(named: restaurant.image)
        
        //Applying the blur effect
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        //moving the view to right corner
        let moveRightTransform = CGAffineTransform(translationX: 600, y: 0)
        //making the view scale up
        let scaleUpTransform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        // combining Two Animations
        let moveScaleTransform = moveRightTransform.concatenating(scaleUpTransform)
        
        
        //making the buttons invisible
        for rateButton in rateButtons {
            rateButton.transform = moveScaleTransform
            rateButton.alpha = 0
        }
        
        //close button animation
        self.closeButton.alpha = 0
        self.closeButton.transform = scaleUpTransform
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //Appling fade in animation
        for index in 0...4 {
            UIView.animate(withDuration: 0.5,
                           delay: (0 + 0.1) * Double(index),
                           options: [],
                           animations: {
                            self.rateButtons[index].alpha = 1.0
                            self.rateButtons[index].transform = .identity
            },
                           completion: nil)
        }
        //animating for close button
        UIView.animate(withDuration: 0.4,
                       delay: 0.3,
                       options: [],
                       animations: {
            self.closeButton.alpha = 1.0
            self.closeButton.transform = .identity
        },
                       completion: nil)
    }
    
}

