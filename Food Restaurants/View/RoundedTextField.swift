//
//  RoundedTextField.swift
//  FoodPin
//
//  Created by Amin  on 11/17/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class RoundedTextField: UITextField {
    
    // for drawing the edges of text
    let padding = UIEdgeInsets(top: 0, left: 10.0, bottom: 0, right: 10.0)
    
    // return text rectangle outer rect
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // return placeHolder text rectangle inner rect
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // return editable text rectangle
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
    }
}
