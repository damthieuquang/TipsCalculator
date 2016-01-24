//
//  ViewController.swift
//  TipsCalculator
//
//  Created by Dam Quang on 1/24/16.
//  Copyright © 2016 Dam Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var percentSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBillTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: private method
    func setupBillTextField() {
//        let frame : CGRect
//        frame = CGRectMake(0, 0, self.view.bounds.size.width, 100)
//        self.bill.frame = frame
//        self.bill.backgroundColor = UIColor.clearColor()
//        self.bill.borderStyle = UITextBorderStyle.None
//        self.bill.textAlignment = NSTextAlignment.Right
//        self.bill.font = UIFont(name: "System", size: 72)
//        self.bill.placeholder = "$0.00"
    }
}

