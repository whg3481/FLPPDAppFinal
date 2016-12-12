//
//  SellingCostModel.swift
//  FLPPDAppFinal
//
//  Created by New User on 12/12/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import Foundation

class SellingCostModel  {
  

  var reCommission : Double!
  var afterRepairValue : Double!
		
  
		
  
  init(RealEstateCommission:Double,ARV:Double) {
    self.reCommission = RealEstateCommission
    self.afterRepairValue = ARV
   
    
  }


func realEstateCommission() -> Double {
  return afterRepairValue*reCommission
}

}
