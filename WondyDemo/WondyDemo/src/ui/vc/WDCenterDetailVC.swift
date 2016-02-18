//
//  SecondViewController.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit

class WDCenterDetailVC: UIViewController, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let kReuseIdentifierImageCell: String = "kReuseIdentifierImageCell"
    let kReuseIdentifierServiceCell: String = "kReuseIdentifierServiceCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var servicesTableView: UITableView!
    
    var center: WDCenter!
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        servicesTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: kReuseIdentifierServiceCell)
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: User Interface
    
    func refreshUI() {
        nameLabel.text = center.name
        descriptionLabel.text = center.description
        addressLabel.text = center.address
    }
    
    //MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return center.imagesURLs.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kReuseIdentifierImageCell, forIndexPath: indexPath) as! WDImageCell
        cell.setImageURL(center.imagesURLs[indexPath.row])
        
        return cell
    }
    
    //MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return center.services.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kReuseIdentifierServiceCell, forIndexPath: indexPath)
        cell.textLabel?.text = center.services[indexPath.row]
        
        return cell
    }

}

