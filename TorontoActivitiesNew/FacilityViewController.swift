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
        tableView.alpha = 0
        let realm = try! Realm()
        
        if realm.objects(Facility.self).count < 1 {
            
            //Network call to retrieve facility info
            NetworkRequestManager.requestJSON {
                
                self.facilities = realm.objects(Facility.self)
                print("Finally Done")
                self.tableView.reloadData()
            }
            
        }
        facilities = realm.objects(Facility.self)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //UITableViewDataSource protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (facilities?.count)! > 0 {
            return facilities!.count
        } else {
            print("It reached the no data point")
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacilityTableViewCell
        
        if (facilities?.count)! > 0 {
            tableView.alpha = 1
            configureCell(cell: cell, indexPath: indexPath)
            
        } else {
            
            createLoadingView()
            print("It reached the no data point")

        }
        
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
    
    func createLoadingView() {
        let loadingView = UIView(frame: view.bounds)
        view.addSubview(loadingView)
        let activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        activityIndicator.color = UIColor.darkGray
        activityIndicator.hidesWhenStopped =  true
        loadingView.addSubview(activityIndicator)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()
    }
    
}

