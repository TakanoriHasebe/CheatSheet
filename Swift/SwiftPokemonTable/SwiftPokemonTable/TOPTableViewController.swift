//
//  TableViewController.swift
//  SwiftPokemonTable
//
//  Created by Takanori.H on 2017/03/18.
//  Copyright © 2017年 Takanori.H. All rights reserved.
//

import UIKit

class TOPTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "日本のポケモン"
        cell.detailTextLabel?.text = "地図を見る"
        cell.imageView?.image = UIImage(named: "japan.png")
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.navigationController!.pushViewController(self.storyboard!.instantiateViewController(withIdentifier: "next") ,
            animated: true)
        
    }
    
    
}
