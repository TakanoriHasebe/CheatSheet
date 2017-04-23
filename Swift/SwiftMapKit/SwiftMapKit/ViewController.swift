//
//  ViewController.swift
//  SwiftMapKit
//
//  Created by Takanori.H on 2017/04/21.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MapViewを生成し、表示する
        let myMapView = MKMapView()
        myMapView.frame = self.view.frame
        self.view.addSubview(myMapView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }


}

