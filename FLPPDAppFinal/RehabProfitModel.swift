//
//  RehabProfitModel.swift
//  FLPPDAppFinal
//
//  Created by New User on 12/11/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import Foundation

class RehabProfitModel  {
  
  var afterRepairValue : Double!
  var actualLtvPct : Double!
  var constructionRetainagePct : Double!
  var repairCosts : Double!
  var wholesaleFEE : Double!
  var purchasePrice : Double
  
		
  
  init(ARV:Double, actualLTV:Double, constRetainPct:Double, rehabCost:Double, wholesaleFee:Double, pPrice:Double) {
    self.afterRepairValue = ARV
    self.actualLtvPct = actualLTV
    self.constructionRetainagePct = constRetainPct
    self.repairCosts = rehabCost
    self.wholesaleFEE = wholesaleFee
    self.purchasePrice = pPrice
    
    
  }
  
  func loanAmountCalc() -> Double {
    return afterRepairValue*actualLtvPct
  }
  
  /*func monthlyPmt() -> Double {
    return
  }
  
  func dailyRate() -> Double {
    return
  }*/
 
   func totalDevelopmentCost() -> Double {
      return repairCosts+wholesaleFEE+purchasePrice
    //Rehab Costs + Buying Costs + Holding Costs + Holding Costs + Selling Costs + Other Costs + Whole Sale Fee + Purchase Price
  }

  
  func constructionRetainage() -> Double {
    return constructionRetainagePct*repairCosts
  }
  
  func netProfit() -> Double {
    return afterRepairValue-totalDevelopmentCost()
  }
  
/* func realEstateCommission() -> Double {
    return afterRepairValue*reCommission
  }*/
  
}
