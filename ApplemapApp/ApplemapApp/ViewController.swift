//
//  ViewController.swift
//  ApplemapApp
//
//  Created by mac on 12/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    var locationmngr = CLLocationManager()
    @IBOutlet weak var mymap: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmngr.requestAlwaysAuthorization()
    }

    @IBAction func map_type(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            mymap.mapType = .standard
        }
        if sender.selectedSegmentIndex == 1 {
            mymap.mapType = .satellite
        }
        if sender.selectedSegmentIndex == 2 {
            mymap.mapType = .hybrid
        }
    }
    
}

