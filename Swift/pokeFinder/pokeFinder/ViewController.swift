//
//  ViewController.swift
//  pokeFinder
//
//  Created by Takanori.H on 2017/04/09.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import MapKit // コピペ

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    // コピペ
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
    
    }

    override func viewWillAppear(_ animated: Bool) {
        
        locationAuthStatus()
        
    }
    
    // コピペ
    // アプリを使っている時にトラッキング
    func locationAuthStatus(){
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            
            mapView.showsUserLocation = true
            
        } else{
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    // コピペ
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse{
            mapView.showsUserLocation = true
        }
        
    }
    
    // コピペ
    // マップの大きさ
    func centerMapLocation(location: CLLocation){
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // コピペ
    // ユーザー情報を中央に配置
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if let loc = userLocation.location{
            
            if !mapHasCenteredOnce{
                centerMapLocation(location: loc)
                mapHasCenteredOnce = true
            }
            
        }
        
    }
    
    
    // コピペ
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        var annotationView: MKAnnotationView?
        
        if annotation.isKind(of: MKUserLocation.self){
            
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotationView?.image = UIImage(named: "ash")
        }
        
        return annotationView
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }

    @IBAction func spotRandomPokemon(_ sender: AnyObject) {
        
        
        
    }

}

