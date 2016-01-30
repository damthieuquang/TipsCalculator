//
//  TipViewController.swift
//  TipsCalculator
//
//  Created by Dam Quang on 1/24/16.
//  Copyright © 2016 Dam Quang. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var percentSegment: UISegmentedControl!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var lbl_result: UILabel!
    @IBOutlet weak var lbl_total: UILabel!
    
    var firstSegment : float_t = 0.0
    var secondSegment : float_t = 0.0
    var thirdSegment : float_t = 0.0
    
    var userDefault = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.alpha = 0
        resultView.backgroundColor = UIColor.clearColor()
        
        self.setupBillTextField()
        setupSegmentPrecent()
        self.setupBill()
        
        /**
        Register notification when the percent of tip changed
        */
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateSegment:", name: "updateValue", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: private method
    @objc func updateSegment(notification : NSNotification) {
        setupSegmentPrecent()
    }
    
    func textFieldDidChange(textField : UITextField) {
        /**
        *  animation
        */
        UIView.animateWithDuration(0.3) { () -> Void in
            self.resultView.alpha = 1
            self.resultView.backgroundColor = UIColor(red: 86/255, green: 205/255, blue: 254/255, alpha: 1)
        }
        
        calculateTipMoney((textField.text! as NSString).floatValue)
    }
    
    func calculateTipMoney(money : float_t) {
        let selectedIndex = percentSegment.selectedSegmentIndex
        var tip : float_t = 0.0
        
        /**
        *  Calculate tip money
        */
        switch (selectedIndex) {
        case 0:
            tip = money * firstSegment / 100
            break
        case 1:
            tip = money * secondSegment / 100
            break
        case 2:
            tip = money * thirdSegment / 100
            break
        default:
            break
        }
        
        /**
        * Update UI
        */
        lbl_result.text = NSString(format: "%.2f$", tip) as String
        lbl_total.text = NSString(format: "%.2f$", tip + money) as String
    }
    
    func setupBillTextField() {
    }
    
    func setupBill() {
        bill.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
    }
    
    func setupSegmentPrecent() {
        /**
         Loading selected segment
         */
        let selectedIndex = userDefault.integerForKey("selectedIndex")
        percentSegment.selectedSegmentIndex = selectedIndex;
        
        /**
        Set value for each segment
        */
        firstSegment = userDefault.floatForKey("firstSegment")
        secondSegment = userDefault.floatForKey("secondSegment")
        thirdSegment = userDefault.floatForKey("thirdSegment")
        
        /**
        *  this code below effective if app run in first time
        */
        if (firstSegment == 0 && secondSegment == 0 && thirdSegment == 0){
            userDefault.setFloat(10, forKey: "firstSegment")
            userDefault.setFloat(15, forKey: "secondSegment")
            userDefault.setFloat(20, forKey: "thirdSegment")
            
            firstSegment = 10
            secondSegment = 15
            thirdSegment = 20
        }
        
        /// Create title for each segment
        let titleFirstSegment = NSString(format: "%.f%%", firstSegment)
        let titleSecondSegment = NSString(format: "%.f%%", secondSegment)
        let titleThirdSegment = NSString(format: "%.f%%", thirdSegment)
        
        /**
        *Update title for each segment
        */
        percentSegment.setTitle(titleFirstSegment as String, forSegmentAtIndex: 0)
        percentSegment.setTitle(titleSecondSegment as String, forSegmentAtIndex: 1)
        percentSegment.setTitle(titleThirdSegment as String, forSegmentAtIndex: 2)
    }
//MARK: Action
    @IBAction func changedMoney(sender: UITextField) {
    }
    
    @IBAction func ChangedIndex(sender: AnyObject) {
        /**
        *  Update money when user changed percent of tip
        */
        textFieldDidChange(bill)
        /**
        *  Store chosen percent of tip
        */
        userDefault.setInteger(percentSegment.selectedSegmentIndex, forKey: "selectedIndex")
    }
    
}

