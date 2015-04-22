//
//  ViewController.swift
//  UberDeepLInkTest
//
//  Created by Kirby Shabaga on 4/21/15.
//  Copyright (c) 2015 Worxly. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        self.mapView.centerCoordinate = userLocation.location.coordinate
    }

    @IBAction func getUber(sender: AnyObject) {
        // The only required property - pickupLocation
//        var pickupLocation = CLLocationCoordinate2D(latitude: 47.6235481, longitude: -122.336212)
        
        var pickupLocation = self.mapView.userLocation.location.coordinate
        
        // Create an Uber instance
        var uber = Uber(pickupLocation: pickupLocation)
        
        // Set a few optional properties
        uber.pickupNickname = "Code Fellows"
        
        uber.dropoffLocation = CLLocationCoordinate2D(latitude: 47.591351, longitude: -122.332271)
        uber.dropoffNickname = "Safeco Field"
        
        // Let's do it!
        uber.deepLink()
    }

}

