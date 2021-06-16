//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by Amin  on 12/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelegate {
    
    //Outlets
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var skipButton: UIButton! {
        didSet {
            skipButton.layer.cornerRadius = 25.0
            skipButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var pageControl: UIPageControl!
    
    //Skip Actions
    @IBAction func skipButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
        dismiss(animated: true, completion: nil)
    }
    
    //Next Action
    @IBAction func nextPageTapped(_ sender: Any) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
            case 2:
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
        updateUI()
    }
    
    
    //instance Variable
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    // Update the page control
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            default:
                break
            }
            pageControl.currentPage = index
        }
    }
    
    //MARK: - Walkthrough Delegate
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
}
