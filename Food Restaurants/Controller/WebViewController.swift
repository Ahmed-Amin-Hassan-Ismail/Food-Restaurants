//
//  WebViewController.swift
//  FoodPin
//
//  Created by Amin  on 12/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    //Outlets
    @IBOutlet weak var webView: WKWebView!
    
    //Variables
    var targetURL = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Disable large title
        navigationItem.largeTitleDisplayMode = .never

        //Creating URL for FeedBack
        if let url = URL(string: targetURL) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
