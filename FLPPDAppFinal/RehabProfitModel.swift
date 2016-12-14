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
  var originationFee : Double!
  var realEstateFee : Double!
  var interestRate : Double!
  
		
  
  init(ARV:Double, actualLTV:Double, constRetainPct:Double, rehabCost:Double, wholesaleFee:Double, pPrice:Double, reFee:Double, originationPoints:Double, intRate:Double) {
    self.afterRepairValue = ARV
    self.actualLtvPct = actualLTV
    self.constructionRetainagePct = constRetainPct
    self.repairCosts = rehabCost
    self.wholesaleFEE = wholesaleFee
    self.purchasePrice = pPrice
    self.originationFee = originationPoints
    self.realEstateFee = reFee
    self.interestRate = intRate
    
    
    
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
      return repairCosts+wholesaleFEE+purchasePrice+calcRealEstateCommission()+calcOriginationPoints()+calcMiscLenderFees()+calcTitleInsurance()+calcPrePaidInterest()
    
  }

  
  func constructionRetainage() -> Double {
    return constructionRetainagePct*repairCosts
  }
  
  func netProfit() -> Double {
    return afterRepairValue-totalDevelopmentCost()
  }
  
  func calcTitleInsurance() -> Double {
    return afterRepairValue*(0.01)
  }
  
  func calcPrePaidInterest() -> Double {
    return loanAmountCalc()*(0.025)
    
  }
  
  func calcMiscLenderFees() -> Double {
    return loanAmountCalc()*(0.015)
  }
  
  func calcOriginationPoints() -> Double {
    return loanAmountCalc()*originationFee
  }
  
  func calcRealEstateCommission() -> Double {
    return afterRepairValue*realEstateFee
  }
  
  func calcMonthlyPayment() -> Double {
    return (loanAmountCalc()*interestRate)/(12)
  }
  
  func calcDailyRate() -> Double {
    return (loanAmountCalc()*interestRate)/(365)
  }
  
  func cashRequiredforClosing() -> Double {
    return (totalDevelopmentCost()-loanAmountCalc())
  }
  
  func calcROI() -> Double {
    return ((netProfit()-cashRequiredforClosing())/cashRequiredforClosing())
  }
  
  
/* func realEstateCommission() -> Double {
    return afterRepairValue*reCommission
  }*/
  
}
