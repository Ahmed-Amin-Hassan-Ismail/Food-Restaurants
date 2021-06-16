//
//  NewRestaurantViewController.swift
//  FoodPin
//
//  Created by Amin  on 11/17/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

class NewRestaurantViewController: UITableViewController, UITextFieldDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate   {
    
    //Outlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var nameTextField: RoundedTextField!{
        didSet {
            // for giving tag number
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    @IBOutlet weak var typeTextField: RoundedTextField! {
        didSet {
            typeTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    @IBOutlet weak var addressTextField: RoundedTextField! {
        didSet {
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    @IBOutlet weak var phoneTextField: RoundedTextField! {
        didSet {
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }
    @IBOutlet weak var desciptionTextView: UITextView! {
        didSet {
            desciptionTextView.tag = 5
            desciptionTextView.layer.cornerRadius = 5.0
            desciptionTextView.layer.masksToBounds = true
        }
    }
    
    // Saved Button Action
    @IBAction func savedButtonTapped(_ sender: UIBarButtonItem) {
        // Checking textFields
        if nameTextField.text == "" || typeTextField.text == "" || addressTextField.text == "" || phoneTextField.text == "" || desciptionTextView.text == "" {
            
            let warningAlert = UIAlertController(title: "Oops!", message: "We can't proceed because one of the fields is blank. please note that all fields all required", preferredStyle: .alert)
            let okayAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            warningAlert.addAction(okayAction)
            
            //display thr alert
            present(warningAlert, animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
         
    }
    
    
    
    
    // MARK: - view controller life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Enable large title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Customize navigation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes =
                [ NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60),
                  NSAttributedString.Key.font: customFont ]
        }
        
        //Separator style
        tableView.separatorStyle = .none
    }
    
    //MARK:- Text Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextTextField = view.viewWithTag(textField.tag + 1) {
            textField.resignFirstResponder()
            nextTextField.becomeFirstResponder()
        }
        return true
    }
    
    //MARK:- Image Picker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        // Auto layout constraints
        let leadingConstraint = NSLayoutConstraint(item: photoImageView as Any,
                                                   attribute: .leading,
                                                   relatedBy: .equal,
                                                   toItem: photoImageView.superview,
                                                   attribute: .leading,
                                                   multiplier: 1.0,
                                                   constant: 0)
        // constraint activation
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView.superview as Any,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: photoImageView,
                                                    attribute: .trailing,
                                                    multiplier: 1.0,
                                                    constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoImageView as Any,
                                               attribute: .top,
                                               relatedBy: .equal,
                                               toItem: photoImageView.superview,
                                               attribute: .top,
                                               multiplier: 1.0,
                                               constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: photoImageView.superview as Any,
                                                  attribute: .bottom,
                                                  relatedBy: .equal,
                                                  toItem: photoImageView,
                                                  attribute: .bottom,
                                                  multiplier: 1.0,
                                                  constant: 0)
        bottomConstraint.isActive = true
        
        // to exit from gallary
        dismiss(animated: true, completion: nil )
        
    }
    
    //MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let photoSourceRequestController = UIAlertController(title: nil , message: "Choose your photo source", preferredStyle: .actionSheet)
            
            // photo from camera
            let cameraAction = UIAlertAction(title: "Camera", style: .default) { (_) in
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            
            // photo from gallary
            let photoLibraryAction = UIAlertAction(title: "photo library", style: .default) { (_) in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            }
            
            // cancel Action
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            // Add Actions
            photoSourceRequestController.addAction(cameraAction)
            photoSourceRequestController.addAction(photoLibraryAction)
            photoSourceRequestController.addAction(cancelAction)
            
            // for ipad
            if let popoverController = photoSourceRequestController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            // display the alert
            present(photoSourceRequestController, animated: true, completion: nil)
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPath.row == 0 {
            nameTextField.resignFirstResponder()
            return indexPath
        } else {
            return nil
        }
    }
    
    
}
