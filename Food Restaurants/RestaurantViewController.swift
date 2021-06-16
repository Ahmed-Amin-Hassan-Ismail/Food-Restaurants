//
//  RestaurantViewController.swift
//  FoodPin
//
//  Created by Amin  on 11/1/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DataCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
        //Checkmark
        cell.heartImageView.isHidden = restaurantIsVisited[indexPath.row] ? false : true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Deleting Action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        //Sharing Action
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (_, _, completionHandler) in
            let defaultText = "Just checking-in at " + self.restaurantNames[indexPath.row]
            
            //Sharing Images
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                 activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            //Presente sharing
            self.present(activityController, animated: true, completion: nil)
            completionHandler(true)
        }
        
        //Swipe Configuration
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    
    //MARK:- TableView Delegate
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        //Creating aleart
        let optionMenue = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        //Cancel Action
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        //Call Action
        let title =  "Call 123-000-\(indexPath.row)"
        let callAction = UIAlertAction(title:title , style: .default) { (_) in
            //Cearing alert
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "sorry,the call feature is not available yet. please try again later.", preferredStyle: .alert)
            
            // okay Action
            let okayAction = UIAlertAction(title: "Ok!", style: .default, handler: nil)
            
            //Adding Actions
            alertMessage.addAction(okayAction)
            
            //Displaying the alert
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        //CheckIn Action
        let CheckTitle = restaurantIsVisited[indexPath.row] ? "Undo Check-In" : "Check-In"
        let checkInAction = UIAlertAction(title: CheckTitle, style: .default) { (_) in
            if let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell {
                self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
                cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            }
        }
        
        //Adding Actions
        optionMenue.addAction(cancelAction)
        optionMenue.addAction(callAction)
        optionMenue.addAction(checkInAction)
        
        //for ipad
        if let popover = optionMenue.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popover.sourceView = cell
                popover.sourceRect = cell.bounds
            }
        }
        
        //DisPlay the menue....
        present(optionMenue, animated: true, completion: nil)
        
        //Diselection the Cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
