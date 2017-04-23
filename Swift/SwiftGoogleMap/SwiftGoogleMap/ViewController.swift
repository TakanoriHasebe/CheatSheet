//
//  ViewController.swift
//  SwiftGoogleMap
//
//  Created by Takanori.H on 2017/04/21.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func loadView() {
            navigationItem.title = "Hello Map"
            
            let camera = GMSCameraPosition.camera(withLatitude: -33.868,
                                                  longitude: 151.2086,
                                                  zoom: 14)
            let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
            
            let marker = GMSMarker()
            marker.position = camera.target
            marker.snippet = "Hello World"
            marker.appearAnimation = GsMSMarkerAnimation
            marker.map = mapView
            
            view = mapView
        }    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

