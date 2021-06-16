//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Amin  on 11/3/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: RestaurantDetailHeaderView!
    
    // unwind segue Actions
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    // rating view
    @IBAction func restaurantRating(segue: UIStoryboardSegue) {
        if let rating = segue.identifier {
            self.restaurant.rating = rating
            self.headerView.ratingImageView.image = UIImage(named: rating)
            
            //scale up animation
            let scaleUpTransform = CGAffineTransform(scaleX: 5.0, y: 5.0)
            self.headerView.ratingImageView.transform = scaleUpTransform
            self.headerView.ratingImageView.alpha = 0
            
            UIView.animate(withDuration: 0.4,
                           delay: 0.3,
                           usingSpringWithDamping: 0.3,
                           initialSpringVelocity: 0.7,
                           options: [],
                           animations: {
                self.headerView.ratingImageView.alpha = 1.0
                self.headerView.ratingImageView.transform = .identity
            },
                           completion: nil)
        }
        dismiss(animated: true, completion: nil)
    }
    
    // instantce variables
    var restaurant: Restaurant!
    
    
    //MARK:- View controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Disable large title
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        //Customize navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .white
        tableView.contentInsetAdjustmentBehavior = .never
        
        //separator style
        tableView.separatorStyle = .none
        
        //configure header view
        headerView.headerImageView.image = UIImage(named: restaurant.image)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.heartImageView.isHidden = !restaurant.isVisited
        
        //conform to protocols
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //Enable navigation bar on swipe
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK:- Table view Data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            
            // cell configuration....
            cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.phone
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            
            //cell configuration
            cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black, renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.location
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            
            //cell configuration
            cell.descriptionLabel.text = restaurant.description
            cell.selectionStyle = .none
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparatorCell.self), for: indexPath) as! RestaurantDetailSeparatorCell
            
            //cell configuration
            cell.titleLabel.text = "HOW TO GET HERE"
            cell.selectionStyle = .none
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            
            //cell configuration
            cell.getMyLocation(location: restaurant.location)
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller.")
        }
    }
    // to specify height of map row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row == 4 else {
            return tableView.rowHeight
        }
        return 215
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //for map transition
        if segue.identifier == "showMap" {
            let controller = segue.destination as! MapViewController
            controller.restaurant = restaurant
            
            //for background transition
        } else if segue.identifier == "showReview"{
            let controller = segue.destination as! ReviewViewController
            controller.restaurant = restaurant
        }
    }
}

