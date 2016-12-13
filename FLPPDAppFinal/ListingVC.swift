//
//  FLPPDapp
//
//  Created by New User on 12/1/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Listing {
  
   let key: String!
   let address: String!
   let ARV: String!
   let itemRef: FIRDatabaseReference?
  
  init(key:String = "", address: String, afterRepairValue:String) {
     self.key = key
     self.address = address
     self.ARV = afterRepairValue
     self.itemRef = nil
     }
  
   init (snapshot: FIRDataSnapshot) {
    
    
      key = snapshot.key
      itemRef = snapshot.ref
      let snapshotValue = snapshot.value as! [String:AnyObject]
      address = snapshotValue["address"] as? String ?? "no address"
      ARV = snapshotValue["After Repair Value"] as? String ?? "no price"
    
     }
   func toAnyObject() -> Any {
      return ["address":address, "After Repair Value": ARV, "key": key]
     }
}

