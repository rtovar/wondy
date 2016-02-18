//
//  WDCenterListVC.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit
import Alamofire

class WDCenterListVC: UITableViewController {
    
    var centersArray: NSArray = []
    let kReuseIdentifierWDCenterCell: String = "kReuseIdentifierWDCenterCell"
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: Selector("launchCenterRequest"), forControlEvents: UIControlEvents.ValueChanged)
        refreshControl?.beginRefreshing()
        launchCenterRequest()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDatasource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return centersArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kReuseIdentifierWDCenterCell, forIndexPath: indexPath) as! WDCenterCell
        cell.setCenter(centersArray[indexPath.row] as! WDCenter)
        
        return cell
    }
    
    //MARK: Reload data
    
    func launchCenterRequest() {
        
        WDAPI.requestCenters { (result) in
            self.centersArray = result
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let centerDetailVC = segue.destinationViewController as! WDCenterDetailVC
        centerDetailVC.center = centersArray[(tableView.indexPathForSelectedRow?.row)!] as! WDCenter
    }

}

