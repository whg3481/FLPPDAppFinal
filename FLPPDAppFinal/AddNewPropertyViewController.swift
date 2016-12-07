//
//  AddNewPropertyViewController.swift
//  FLPPDAppFinal
//
//  Created by New User on 12/6/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class AddNewPropertyViewController: UIViewController {
    @IBOutlet weak var addressTextField: UITextField!
  
  var dbRef:FIRDatabaseReference!
  
  // let firebase = Firebase(url:"https://flppd2-a66ae.firebaseio.com/")
  
  //My properties
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
       dbRef = FIRDatabase.database().reference().child("property-feed")
  }
  
  //This is the Submit button to Add Listin Information to the TableFiew and Firebase
  @IBAction func ListPropertyBtn(_ sender: UIButton) {
   
    // FIRDatabase.database().reference().childByAutoId().setValue(["name": "Kingston"])

    let property = ["title":"My House"]
    let propertyListing = self.dbRef.child(self.addressTextField.text!)
    propertyListing.setValue(property)
    
    
    // Write data to Firebase
    // propertyListing.setValue(user.self)
  }

  
    /*
    if (addressTextField.text == ""){
      //Task Title is blank, do not add a record
    } else {
      //add record
      let name: String = addressTextField.text!
      let propertyAddress: String = "1200 Richmond"
      
      //dismiss keyboard and reset fields
      
      self.view.endEditing(true)
      name.text = nil
      propertyAddress.text = nil
      
    } */
    
    
  }
  
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
      textField.resignFirstResponder()
      return true
    }
    
    
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


