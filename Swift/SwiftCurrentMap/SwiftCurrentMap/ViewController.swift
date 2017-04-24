//
//  ViewController.swift
//  SwiftCurrentMap
//
//  Created by Takanori.H on 2017/04/24.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    var myLocationManager:CLLocationManager!
    
    var latitude:Double = Double()
    var longitude:Double = Double()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imat()
        
    }

    func imat(){
        
        // 現在地の取得
        myLocationManager = CLLocationManager()
        
        myLocationManager.delegate = self
        mapView.delegate = self
        
        
        // セキュリティ認証のステータスを取得.
        let status = CLLocationManager.authorizationStatus()
        
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if(status == CLAuthorizationStatus.notDetermined) {
            // まだ承認が得られていない場合は、認証ダイアログを表示.
            self.myLocationManager.requestAlwaysAuthorization()
            self.myLocationManager.requestWhenInUseAuthorization()
            
        }
        
        
        
        // 取得精度の設定.
        myLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        myLocationManager.startUpdatingLocation()
        
        latitude = myLocationManager.location!.coordinate.latitude
        longitude = myLocationManager.location!.coordinate.longitude
        let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        
        let span = MKCoordinateSpanMake(0.003, 0.003)
        
        let region = MKCoordinateRegionMake(coordinate, span)
        
        mapView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "ここから"
        annotation.subtitle = "現在地です。"
        mapView.addAnnotation(annotation)
        
        
        
        /*
         // 緯度・経度の表示.
         latitude = myLocationManager.location!.coordinate.latitude
         
         longitude = myLocationManager.location!.coordinate.longitude
         
         //ここの値を変更することで現在地を操れる
         let coordinate = CLLocationCoordinate2DMake(latitude,longitude)
         let span = MKCoordinateSpanMake(0.003, 0.003)
         let region = MKCoordinateRegionMake(coordinate, span)
         
         mapView.setRegion(region, animated:true)
         
         let annotation = MKPointAnnotation()
         annotation.coordinate = coordinate
         annotation.title = "ここから"
         annotation.subtitle = "現在地です。"
         
         self.mapView.addAnnotation(annotation)
         
         */

        
    }
    
    // Called when the annotation was added
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            pinView?.isDraggable = true
            pinView?.pinTintColor = .purple
            let rightButton: AnyObject! = UIButton(type: UIButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = rightButton as? UIView
        }
        else {
            pinView?.annotation = annotation
        }
        
        return pinView
    }
    
    //ボタン押下時の呼び出しメソッド
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        // マップアプリに渡す目的地の位置情報を作る。
        // 六本木ヒルズ
        let coordinate = CLLocationCoordinate2DMake(35.660428, 139.729182)
        let placemark = MKPlacemark(coordinate:coordinate, addressDictionary:nil)
        let mapItem = MKMapItem(placemark: placemark)
        
        //起動オプション
        let option:[String:AnyObject] = [MKLaunchOptionsDirectionsModeKey:MKLaunchOptionsDirectionsModeDriving as AnyObject, //車で移動
            MKLaunchOptionsMapTypeKey : MKMapType.hybrid.rawValue as AnyObject]  //地図表示はハイブリッド
        
        //マップアプリを起動する。
        mapItem.openInMaps(launchOptions: option)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

