//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by Amin  on 12/15/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelegate: class  {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE",
                        "SHOW YOU THE LOCATION",
                        "DISCOVER GREAT RESTAURANTS"]
    
    var pageImages = ["onboarding-1",
                      "onboarding-2",
                      "onboarding-3"]
    
    var pageSubHeadings = ["Pin your favorite restaurants and create your own food guide",
                           "Search and locate your favourite restaurant on Maps",
                           "Find restaurants shared by your friends and other foodies"]
    
    
    var currentIndex = 0
    
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelegate?
    
    //MARK: - view controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set the data source to itself
        dataSource = self
        
        // set the delegate to itself
        delegate = self
        
        // instantiate the first content view controller
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    //MARK: - Page controller Data Source
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        return contentViewController(at: index)
    }
    
    //MARK: - Page Controller Delegate
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkthroughContentViewController {
                
                currentIndex = contentViewController.index
                
                walkthroughDelegate?.didUpdatePageIndex(currentIndex: contentViewController.index)
            }
        }
    }
    
    //MARK: - private Methods
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        } else {
            // creating a new view controller as passing data
            let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
            if let pageContentViewController = storyboard.instantiateViewController(identifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
                pageContentViewController.heading = pageHeadings[index]
                pageContentViewController.subHeading = pageSubHeadings[index]
                pageContentViewController.imageFile = pageImages[index]
                
                return pageContentViewController
            }
        }
        return nil
    }
    
    //forward Page
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
}
