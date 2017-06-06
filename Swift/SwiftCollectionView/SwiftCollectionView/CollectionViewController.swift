//
//  ViewController.swift
//  SwiftCollectionView
//
//  Created by Takanori.H on 2017/06/06.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    var imageViewArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewArray = [#imageLiteral(resourceName: "elephant"), #imageLiteral(resourceName: "elephant"), #imageLiteral(resourceName: "elephant"), #imageLiteral(resourceName: "elephant"), #imageLiteral(resourceName: "elephant"), #imageLiteral(resourceName: "elephant"), #imageLiteral(resourceName: "elephant")]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imageViewArray.count
    }

    /*
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) 
        
        let imageView = cell.viewWithTag(1) as! UIImageView
        imageView.image = imageViewArray[indexPath.row]
        
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, animations: ({
            
            cell?.frame = collectionView.bounds
            collectionView.isScrollEnabled = false
            cell?.superview?.bringSubview(toFront: cell!)
            
        }), completion: nil)
    }
    */
}

