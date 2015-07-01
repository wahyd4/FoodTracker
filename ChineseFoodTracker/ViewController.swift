//
//  ViewController.swift
//  ChineseFoodTracker
//
//  Created by Junv on 6/24/15.
//  Copyright © 2015 goldendata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    
    
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    //MARK: UIImagePickerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        mealImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    //MARK: Actions
    
    @IBAction func selectPhotoFromImageLibrary(sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .PhotoLibrary
        imagePickerController.delegate = self
        presentViewController(imagePickerController, animated: true, completion: nil)
    }


}

