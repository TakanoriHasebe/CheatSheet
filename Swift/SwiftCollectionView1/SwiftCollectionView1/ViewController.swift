//
//  ViewController.swift
//  SwiftCollectionView1
//
//  Created by Takanori.H on 2017/06/06.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var images = ["one", "two", "three", "four", "five", "six"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
    
        return images.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        cell.layer.cornerRadius = 50
        
        cell.myImage.image = UIImage(named: images[indexPath.row])
        cell.myImage.contentMode = .scaleAspectFill
        
        
        return cell
        
    }

}

