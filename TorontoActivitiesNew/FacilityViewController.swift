//
//  FacilityViewController.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-16.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import UIKit
import RealmSwift

class FacilityViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    //Properties
    var facilities : Results<Facility>?
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //Network call to retrieve facility info
        NetworkRequestManager.requestJSON {
            let realm = try! Realm()
            self.facilities = realm.objects(Facility.self)
            self.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //UITableViewDataSource protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let f = facilities {
            return f.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacilityTableViewCell
        
        configureCell(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: FacilityTableViewCell, indexPath: IndexPath) {
        if let f = facilities {
            if let a = f[indexPath.row].address {
                cell.addressLabel.text = a
            } else {
                cell.addressLabel.text = "Nil Value"
            }
            if let n = f[indexPath.row].locationName {
                cell.nameLabel.text = n
            } else {
                cell.nameLabel.text = "Nil Value"
            }
        }
    }
    
}

