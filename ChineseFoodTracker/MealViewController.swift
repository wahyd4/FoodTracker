//
//  MealViewController.swift
//  ChineseFoodTracker
//
//  Created by Junv on 6/24/15.
//  Copyright © 2015 goldendata. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: properties
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var mealImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var meal = Meal?()
    
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
    
    //MARK:Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = textField.text ?? ""
            let mealImage = mealImageView.image
            let rating = ratingControl.rating
            meal = Meal(name: name, rating: rating, photo: mealImage)
        }
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

