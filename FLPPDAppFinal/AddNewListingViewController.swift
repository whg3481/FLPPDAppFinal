//
//  AddNewListingViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/29/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

protocol AddListingViewControllerDelegate: class {
  // func addListingViewControllerDelegateDidAddListing(list: Property)
}


class AddNewListingViewController: UIViewController {
  
  var dbRef:FIRDatabaseReference!
  
  @IBOutlet weak var Address: UITextField!
  @IBOutlet weak var Zipcode: UITextField!
  @IBOutlet weak var State: UITextField!
  @IBOutlet weak var City: UITextField!
  @IBOutlet weak var ARV: UITextField!
  @IBOutlet weak var ListPrice: UITextField!
  @IBOutlet weak var PropertyDescription: UITextView!
  
  @IBAction func ListButton(_ sender: UIButton) {
    
    
    
    
    let dictionary = ["address":Address.text!,"zipcode":Zipcode.text!,"State":State.text!,"City":City.text!,"After Repair Value":ARV.text!,"List Price":ListPrice.text!,"Property Description":PropertyDescription.text!]
    
    dbRef = FIRDatabase.database().reference().child("listing-items")
    let propertyListing = self.dbRef.childByAutoId() //.childByAutoId()
    propertyListing.setValue(dictionary)
    
    
    
    
    
    self.dismiss(animated: true, completion: nil)
  }
  @IBAction func cancelListing(_ sender: AnyObject) {
    // This cancels the post without submitting it
    presentingViewController?.dismiss(animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
   // MARK: - USE This for seguing to detail view controller about the property information
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
