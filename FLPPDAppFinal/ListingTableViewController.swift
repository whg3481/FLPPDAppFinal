//
//  ListingTableViewController.swift
//  FLPPDapp
//
//  Created by New User on 11/30/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//



import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class ListingTableViewController: UITableViewController {
  
  
  var dbRef:FIRDatabaseReference!
  var listings = [Listing]()
  
  var address = ""
  var city = ""
  var ARV = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    dbRef = FIRDatabase.database().reference().child("listing-items")
    startObservingDB()
  }
  
  func startObservingDB () {
    dbRef.observe(.value, with: {  (snapshot:FIRDataSnapshot) in
      var newListings = [Listing]()
      
      for listing in snapshot.children {
        print("json: \(listing)")
        let listingObject = Listing(snapshot: listing as! FIRDataSnapshot)
        
        newListings.append(listingObject)
      }
      
      self.listings = newListings
      self.tableView.reloadData()
      
      
      
    }) { (error: Error) in
      print(error)
      
    }
  }
  
  
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return listings.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    /* let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     
     let listing = listings[indexPath.row]
     
     
     cell.textLabel?.text = listing.address
     cell.detailTextLabel?.text = listing.addedByUser
     
     return cell*/
    
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    
    let listing = listings[indexPath.row]
    
    
    let label1 = cell?.viewWithTag(1) as! UILabel
    label1.text = listing.address
    
    let label2 = cell?.viewWithTag(2) as! UILabel
    label2.text = "$\(listing.ARV!)"
      //create the imageview
    
    //download the image in a thread
    
    
    
    return cell!
    
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let listing = listings[indexPath.row]
    
    print(listing.address)
  }
  
  
  
  }

  



