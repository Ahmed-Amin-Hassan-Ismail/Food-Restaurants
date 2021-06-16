//
//  WalkthroughContentViewController.swift
//  FoodPin
//
//  Created by Amin  on 12/14/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var subHeadingLabel: UILabel! {
        didSet {
            subHeadingLabel.numberOfLines = 0
        }
    }
    @IBOutlet weak var headingLabel: UILabel! {
        didSet {
            headingLabel.numberOfLines = 0
        }
    }
    
    var heading = ""
    var subHeading = ""
    var imageFile = ""
    var index = 0
    
    //MARK: - view controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // passing data to objects
        headingLabel.text = heading
        subHeadingLabel.text = subHeading
        contentImageView.image = UIImage(named: imageFile)
        
    }
}
