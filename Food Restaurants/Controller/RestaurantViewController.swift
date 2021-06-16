//
//  RestaurantViewController.swift
//  FoodPin
//
//  Created by Amin  on 11/1/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RestaurantViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable cell width for ipad
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        //Enable large title
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DataCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
        
        //Checkmark
        cell.heartImageView.isHidden = !restaurant.isVisited
        
        return cell
    }
    
    
    //MARK:- TableView Delegate
    
    //    override func tableView(_ tableView: UITableView,
    //                            didSelectRowAt indexPath: IndexPath) {
    //        //Creating aleart
    //        let optionMenue = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
    //
    //        //Cancel Action
    //        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
    //
    //        //Call Action
    //        let title =  "Call 123-000-\(indexPath.row)"
    //        let callAction = UIAlertAction(title:title , style: .default) { (_) in
    //            //Cearing alert
    //            let alertMessage = UIAlertController(title: "Service Unavailable", message: "sorry,the call feature is not available yet. please try again later.", preferredStyle: .alert)
    //
    //            // okay Action
    //            let okayAction = UIAlertAction(title: "Ok!", style: .default, handler: nil)
    //
    //            //Adding Actions
    //            alertMessage.addAction(okayAction)
    //
    //            //Displaying the alert
    //            self.present(alertMessage, animated: true, completion: nil)
    //        }
    //
    //        //CheckIn Action
    //        let CheckTitle = restaurantIsVisited[indexPath.row] ? "Undo Check-In" : "Check-In"
    //        let checkInAction = UIAlertAction(title: CheckTitle, style: .default) { (_) in
    //            if let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell {
    //                self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
    //                cell.heartImageView.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
    //            }
    //        }
    //
    //        //Adding Actions
    //        optionMenue.addAction(cancelAction)
    //        optionMenue.addAction(callAction)
    //        optionMenue.addAction(checkInAction)
    //
    //        //for ipad
    //        if let popover = optionMenue.popoverPresentationController {
    //            if let cell = tableView.cellForRow(at: indexPath) {
    //                popover.sourceView = cell
    //                popover.sourceRect = cell.bounds
    //            }
    //        }
    //
    //        //DisPlay the menue....
    //        present(optionMenue, animated: true, completion: nil)
    //
    //        //Diselection the Cell
    //        tableView.deselectRow(at: indexPath, animated: true)
    //    }
    
    // Trailing Swipe Action
    override func tableView(_ tableView: UITableView,
                            trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Deleting Action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (_, _, completionHandler) in
            self.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        //Sharing Action
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (_, _, completionHandler) in
            let defaultText = "Just checking-in at " + self.restaurants[indexPath.row].name
            
            //Sharing Images
            let activityController: UIActivityViewController
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            //Presente sharing
            self.present(activityController, animated: true, completion: nil)
            
            //For popover Style
            if let popover = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popover.sourceView = cell
                    popover.sourceRect = cell.bounds
                }
            }
            completionHandler(true)
        }
        
        //Configure the buttons
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 67.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        //Swipe Configuration
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        return swipeConfiguration
    }
    
    //Leading Swipe Action
    override func tableView(_ tableView: UITableView,
                            leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInAction = UIContextualAction(style: .normal, title:"") { (_, _, completionHandler) in
            if let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell {
                self.restaurants[indexPath.row].isVisited = !self.restaurants[indexPath.row].isVisited
                cell.heartImageView.isHidden = !self.restaurants[indexPath.row].isVisited
                
                completionHandler(true)
            }
        }
        
        let tickImage = UIImage(named: "tick")
        let undoImage = UIImage(named: "undo")
        let imageAction = restaurants[indexPath.row].isVisited ? undoImage : tickImage
        checkInAction.image = imageAction
        checkInAction.backgroundColor = UIColor(red: 38.0/255.0, green: 162.0/255.0, blue: 78.0/255.0, alpha: 1.0)
        
        return UISwipeActionsConfiguration(actions: [checkInAction])
    }
    
    //MARK:- Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
    }
}
