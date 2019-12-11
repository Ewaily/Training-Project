//
//  MapViewController.swift
//  Swifty
//
//  Created by Muhammad Ewaily on 11/17/19.
//  Copyright © 2019 Muhammad Ewaily. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func loadView() {
      // Create a GMSCameraPosition that tells the map to display the
      // coordinate -33.86,151.20 at zoom level 6.
      let camera = GMSCameraPosition.camera(withLatitude: 31.200092, longitude: 29.918739, zoom: 6.0)
      let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
      view = mapView

      // Creates a marker in the center of the map.
      let marker = GMSMarker()
      marker.position = CLLocationCoordinate2D(latitude: 31.200092, longitude: 29.918739)
      marker.title = "Alexandria"
      marker.snippet = "Egypt"
      marker.map = mapView
        
    }

}
