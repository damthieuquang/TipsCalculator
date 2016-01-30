//
//  SettingsViewController.swift
//  TipsCalculator
//
//  Created by Dam Quang on 1/24/16.
//  Copyright © 2016 Dam Quang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    let cellIdentifier = "cellIdentifier"
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateCell:", name: "updateValue", object: nil)
        setupTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: private method
    @objc func updateCell(notification : NSNotification) {
        let index = notification.object
        let indexPath = NSIndexPath(forRow: (index?.integerValue)!, inSection: 0)
        myTableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
    }
    
    func setupTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
        let nibName = UINib(nibName: "PercentTipTableViewCell", bundle: nil)
        myTableView.registerNib(nibName, forCellReuseIdentifier: cellIdentifier)
        
        myTableView.tableFooterView = UIView()
    }
    
    //MARK: tableViewDelegate & DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:PercentTipTableViewCell = myTableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PercentTipTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.updateCell("Minimum", percent: NSUserDefaults.standardUserDefaults().objectForKey("firstSegment") as! NSInteger)
            break;
        case 1:
            cell.updateCell("Medium", percent: NSUserDefaults.standardUserDefaults().objectForKey("secondSegment") as! NSInteger)
            break;
        case 2:
            cell.updateCell("Maximum", percent: NSUserDefaults.standardUserDefaults().objectForKey("thirdSegment") as! NSInteger)
            break;
        default:
            break;
        }
        
        return cell
    }

}
