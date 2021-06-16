//
//  RestaurantDetailHeaderView.swift
//  FoodPin
//
//  Created by Amin  on 11/4/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RestaurantDetailHeaderView: UIView {
    
    // Outlets
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!{
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var typeLabel: UILabel! {
        didSet {
            typeLabel.layer.cornerRadius = 5.0
            typeLabel.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var heartImageView: UIImageView! {
        didSet {
            heartImageView.image = UIImage(named: "heart-tick")?.withRenderingMode(.alwaysTemplate)
            heartImageView.tintColor = .white
            
        }
    }
    @IBOutlet weak var ratingImageView: UIImageView!
}
