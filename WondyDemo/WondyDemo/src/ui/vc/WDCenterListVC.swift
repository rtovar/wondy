//
//  WDCenterListVC.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

class WDCenterListVC: UITableViewController {
    
    var centersArray: NSMutableArray = []
    let kReuseIdentifierWDCenterCell: String = "kReuseIdentifierWDCenterCell"
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: Selector("launchCenterCall"), forControlEvents: UIControlEvents.ValueChanged)
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
    
    func launchCenterCall()
    {
        centersArray = [WDCenter.init(identifier: "1234", name: "Super Centro", address: "Avda. Pepa, 16, 08018 Barcelona", imagesURLs: ["https://wondy.s3.amazonaws.com/shops/29/29_db316.jpg"])]
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }

}

