//
//  EvaluateTableViewController.swift
//  FLPPDAppFinal
//
//  Created by New User on 12/9/16.
//  Copyright © 2016 Will Garner. All rights reserved.
//

import UIKit

class EvaluateTableViewController: UITableViewController {

  //var identities = [String]()
  //MARK: Add all my IB Outlets from the Main Evaluation Static TVC here.
  
  @IBOutlet weak var afterRepairValueTextField: UITextField!
  @IBOutlet weak var RehabCostsTextField: UITextField!
  @IBOutlet weak var buyingCostsLabel: UILabel!
  @IBOutlet weak var holdingCostsLabel: UILabel!
  @IBOutlet weak var sellingCostsLabel: UILabel!
  @IBOutlet weak var otherCostsLabel: UILabel!
  @IBOutlet weak var wholesaleFeeTextField: UITextField!
  @IBOutlet weak var purchasePriceTextField: UITextField!
  @IBOutlet weak var totalCostsLabel: UILabel!
  @IBOutlet weak var hardMoneyLTVTexField: UITextField!
  @IBOutlet weak var downPMTPctTextField: UITextField!
  @IBOutlet weak var interestRatePctTextField: UITextField!
  @IBOutlet weak var originationFeeTextField: UITextField!
  @IBOutlet weak var downPMTLabel: UILabel!
  @IBOutlet weak var loanToCostPctLabel: UILabel!
  @IBOutlet weak var loanAmtLabel: UILabel!
  @IBOutlet weak var projectedProfitLabel: UILabel!
  @IBOutlet weak var cashRequiredLabel: UILabel!
  @IBOutlet weak var actualLoanToCostLabel: UILabel!
  @IBOutlet weak var yieldPctLabel: UILabel!
  @IBOutlet weak var returnOnInvestmentPctLabel: UILabel!
  @IBOutlet weak var retainagePctTextField: UITextField!
  @IBOutlet weak var retainageAmountLabel: UILabel!

  
  
  
    override func viewDidLoad() {
        super.viewDidLoad()

      //    identities = ["property","arv"]
      
    }
  
  
  @IBAction func calculateButton(_ sender: AnyObject) {
    let arv = Double(afterRepairValueTextField.text!)
    let ltv = Double(hardMoneyLTVTexField.text!)
    let retainagePct = Double(retainagePctTextField.text!)
    let rehabCosts = Double(RehabCostsTextField.text!)
    let wholesaleFee = Double(wholesaleFeeTextField.text!)
    let actualPrice = Double(purchasePriceTextField.text!)
    
    
    var model = RehabProfitModel(ARV: arv!, actualLTV: ltv!, constRetainPct:retainagePct!, rehabCost:rehabCosts!, wholesaleFee:wholesaleFee!,pPrice:actualPrice!)
    
    
    loanAmtLabel.text = String(model.loanAmountCalc())
    
    // Calculating Retainage Here
    retainageAmountLabel.text = String(model.constructionRetainage())
    
    //Sum of Total Costs
    totalCostsLabel.text = String(model.totalDevelopmentCost())
    
    //Net Profit
    projectedProfitLabel.text = String(model.netProfit())
    
  }
  

  
   func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)  {
    
    
    
    switch indexPath.row {
    case 0:
      self.performSegue(withIdentifier: "A", sender: self)
    default:
      break
      
     

    }
    
    /*let EvalTVC = storyboard?.instantiateInitialViewController("sellingCostTVC") as! SellingCostsTableViewController
    EvalTVC.stringPassed = arv.text!
    navigationController?.pushViewController(EvalTVC, animated: true)*/
    
    
    }
  
  

  
    /*let vcName = identities[indexPath.row]
    let viewController = storyboard?.instantiateViewController(withIdentifier: vcName)
    self.navigationController?.pushViewController(viewController!, animated: true)*/

  }

  
    // MARK: - Table view data source

  /*
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }*/

  /* override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/
  
  

  
   /* override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }*/
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


