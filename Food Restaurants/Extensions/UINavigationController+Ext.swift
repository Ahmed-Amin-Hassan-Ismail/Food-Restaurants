//
//  UINavigationController+Ext.swift
//  FoodPin
//
//  Created by Amin  on 11/14/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
