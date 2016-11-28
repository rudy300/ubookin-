//
//  MapViewController.swift
//  MyFilesSwift9
//
//  Created by cis290 on 11/28/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate  {

     var locationManager = CLLocationManager()
    @IBOutlet weak var mapview: MKMapView!
    
    
    @IBOutlet weak var lbllocation: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Core Location Manager asks for GPS location
        if (CLLocationManager.locationServicesEnabled())
        {
            
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestAlwaysAuthorization()
            // For use in foreground
            self.locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }        else{
            print("Location service disabled");
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations.last
        
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        
        self.mapview.setRegion(region, animated: true)
        
        //self.locationManager.stopUpdatingLocation()
        lbllocation.text = "MyGeoLocation: \(location!.coordinate.latitude),\(location!.coordinate.longitude)"
        
        
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    override func viewDidAppear(animated: Bool) {
        
        mapview.showsUserLocation = true
        
    }

}
