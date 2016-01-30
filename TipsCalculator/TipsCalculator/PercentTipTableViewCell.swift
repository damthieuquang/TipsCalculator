//
//  PercentTipTableViewCell.swift
//  TipsCalculator
//
//  Created by Dam Quang on 1/30/16.
//  Copyright © 2016 Dam Quang. All rights reserved.
//

import UIKit

class PercentTipTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_level: UILabel!
    @IBOutlet weak var txt_percent: UITextField!
    
    var _percent : String = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        lbl_level.backgroundColor = UIColor.clearColor()
        txt_percent.backgroundColor = UIColor.clearColor()
        self.selectionStyle = UITableViewCellSelectionStyle.None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    /**
     Update Cell
     
     - parameter name:    Name
     - parameter percent: Percent
     */
    func updateCell(name : String, percent: NSInteger) {
        _percent = NSString(format: "%d",percent) as String
        
        lbl_level.text = name
        txt_percent.text = NSString(format: "%d%%", percent) as String
    }
    
    @IBAction func editingBegin(sender: UITextField) {
        txt_percent.text = _percent
    }

    @IBAction func endingEdit(sender: UITextField) {
        if (lbl_level.text == "Minimum") {
            NSUserDefaults.standardUserDefaults().setFloat((txt_percent.text! as NSString).floatValue, forKey: "firstSegment")
            NSNotificationCenter.defaultCenter().postNotificationName("updateValue", object: 0)
        } else if (lbl_level.text == "Medium") {
            NSUserDefaults.standardUserDefaults().setFloat((txt_percent.text! as NSString).floatValue, forKey: "secondSegment")
            NSNotificationCenter.defaultCenter().postNotificationName("updateValue", object: 1)

        } else {
            NSUserDefaults.standardUserDefaults().setFloat((txt_percent.text! as NSString).floatValue, forKey: "thirdSegment")
            NSNotificationCenter.defaultCenter().postNotificationName("updateValue", object: 2)
        }
    }
}
