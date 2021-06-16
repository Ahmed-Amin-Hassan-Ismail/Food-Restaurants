//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by Amin  on 11/1/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit


class RestaurantTableViewCell: UITableViewCell {
    //Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView! {
        didSet {
            thumbnailImageView.layer.cornerRadius = thumbnailImageView.bounds.width / 2
            thumbnailImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var heartImageView: UIImageView!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
