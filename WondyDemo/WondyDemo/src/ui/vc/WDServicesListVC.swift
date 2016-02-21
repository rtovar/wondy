//
//  WDServicesListVC.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 19/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

class WDServicesListVC: UITableViewController {
    
    let kReuseIdentifierServiceCell = "kReuseIdentifierServiceCell"
    
    var centerName: String = ""
    var servicesArray: NSArray = []
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationItem.setTitleImage("wondy_selected", imageTintColor: UIColor.themeColor())
        tableView.tableFooterView = UIView()
        tableView.reloadData()
    }
    
    //MARK: UITableViewDatasource
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return centerName
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kReuseIdentifierServiceCell, forIndexPath: indexPath)
        cell.textLabel?.text = (servicesArray[indexPath.row] as! String)
        
        return cell
    }
}
