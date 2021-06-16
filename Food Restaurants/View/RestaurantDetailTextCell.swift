//
//  RestaurantDetailTextCell.swift
//  FoodPin
//
//  Created by Amin  on 11/4/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RestaurantDetailTextCell: UITableViewCell {

    //Outlets
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
