//
//  AboutTableViewController.swift
//  FoodPin
//
//  Created by Amin  on 12/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {
    
    var sectionTitles = ["Feedback",
                         "Follow Us"]
    
    var sectionContent = [
        [(image: "store",
          text: "Rate us on App Store",
          link: "https://www.apple.com/ios/app-store/"),
         (image: "chat",
          text: "Tell us your feedback",
          link: "http://www.appcoda.com/contact")],
        [(image: "twitter",
          text: "Twitter",
          link: "https://twitter.com/appcodamobile"),
         (image: "facebook",
          text: "Facebook",
          link: "https://facebook.com/appcodamobile"),
         (image: "instagram",
          text: "Instagram",
          link: "https://www.instagram.com/appcodadotcom")]
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for tablet cell layout
        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // enable large title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //Customize navigation title
        navigationController?.navigationBar.setBackgroundImage(UIImage(),
                                                               for: .default)
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes =
                [NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60) ,
                 NSAttributedString.Key.font: customFont ]
        }
        tableView.tableFooterView = UIView()
        
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        
        return sectionTitles[section]
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AboutCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        //Configure cell...
        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Mobile safari
        let link = sectionContent[indexPath.section][indexPath.row].link
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url)
                }
                // WkWeb View
            } else if indexPath.row == 1 {
                performSegue(withIdentifier: "showWebView", sender: self)
            }
            // Safari Services
        case 1:
            if let url = URL(string: link) {
                let safariController = SFSafariViewController(url: url)
                present(safariController, animated: true, completion: nil)
            }
            
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebView" {
            if let indexPath = tableView.indexPathForSelectedRow {
                if let controller = segue.destination as? WebViewController {
                    controller.targetURL = sectionContent[indexPath.section][indexPath.row].link
                }
            }
        }
    }
    
}
