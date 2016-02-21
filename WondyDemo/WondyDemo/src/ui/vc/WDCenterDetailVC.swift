//
//  SecondViewController.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 16/02/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit
import MapKit

class WDCenterDetailVC: UIViewController, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let kReuseIdentifierImageCell: String = "kReuseIdentifierImageCell"
    let kReuseIdentifierServiceCell: String = "kReuseIdentifierServiceCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagesCollectionView: UICollectionView!
    @IBOutlet weak var descriptionTextview: UITextView!
    @IBOutlet weak var servicesButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    var center: WDCenter!
    
    //MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.setTitleImage("wondy_selected", imageTintColor: UIColor.themeColor())
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: User Interface
    
    func refreshUI() {
        nameLabel.text = center.name
        descriptionTextview.text = center.description
        servicesButton.setTitle(String(format: "%d services", center.services.count), forState: UIControlState.Normal)
        addressLabel.text = center.address
        mapView.setRegion(MKCoordinateRegion.init(center: CLLocationCoordinate2D.init(latitude:center.lat, longitude:center.long), span: MKCoordinateSpan.init(latitudeDelta:0.01, longitudeDelta:0.01)),
            animated: true)
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
    
    //MARK: IBActions
    
    @IBAction func didTapAddressButton() {
        let regionSpan = mapView.region
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(MKCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(MKCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: mapView.centerCoordinate, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = center.name
        mapItem.openInMapsWithLaunchOptions(options)
    }
    
    //MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let servicesListVC = segue.destinationViewController as! WDServicesListVC
        servicesListVC.servicesArray = center.services
        servicesListVC.centerName = center.name
    }

}

