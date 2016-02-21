//
//  WDMapVC.swift
//  WondyDemo
//
//  Created by Rocío Tovar on 20/2/16.
//  Copyright © 2016 Rocío Tovar. All rights reserved.
//

import UIKit
import MapKit

class WDMapVC: UIViewController, MKMapViewDelegate {
    
    let kSegueIdentifierPushDetail: String = "kSegueIdentifierPushDetail"
    let kReuseIdentifierWDAnnotation: String = "kReuseIdentifierWDAnnotation"
    
    @IBOutlet weak var mapView: MKMapView!
    
    var centersArray: [WDCenter]?
    var selectedCenter: WDCenter?
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setTitleImage("wondy_selected", imageTintColor: UIColor.themeColor())
        mapView.delegate = self
        launchCenterRequest()
    }
    
    //MARK: Setup
    
    func setupAnnotations() {
        if centersArray != nil {
            var annotations: [MKAnnotation] = []
            for var i = 0; i < centersArray!.count; ++i {
                let center = centersArray![i]
                let centerAnnotation = WDAnnotation(latitude: center.lat, longitude: center.long, title: center.name)
                annotations.append(centerAnnotation)
            }
            mapView.showAnnotations(annotations, animated: true)
        }
    }
    
    //MARK: Reload data
    
    func launchCenterRequest() {
        WDAPI.requestCenters { (result) in
            self.centersArray = result as? [WDCenter]
            self.setupAnnotations()
        }
    }
    
    //MARK: MKMapViewDelegate
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier(kReuseIdentifierWDAnnotation)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: kReuseIdentifierWDAnnotation)
            annotationView!.canShowCallout = true
            let infoButton = UIButton(type: .DetailDisclosure)
            infoButton.tintColor = UIColor.themeColor()
            annotationView!.rightCalloutAccessoryView = infoButton
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if let annotation = view.annotation as? WDAnnotation {
            selectedCenter = centersArray!.filter{ $0.lat == annotation.latitude && $0.long == annotation.longitude }.first
            self.performSegueWithIdentifier(kSegueIdentifierPushDetail, sender: nil)
        }
    }
    
    // MARK: Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let centerDetailVC = segue.destinationViewController as! WDCenterDetailVC
        centerDetailVC.center = selectedCenter
    }
}
