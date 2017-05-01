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
    

    //MARK: Properties
    var facilities : Results<Facility>?
    
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        activityIndicator.transform = CGAffineTransform.init(scaleX: 3.0, y: 3.0)
        
        let realm = try! Realm()
        
        if realm.objects(Facility.self).count < 1 {
            
            //Network call to retrieve facility info
            NetworkRequestManager.requestJSON {
                self.facilities = realm.objects(Facility.self)
                self.loadingView.alpha = 0
                self.tableView.reloadData()
            }
            
        }
        facilities = realm.objects(Facility.self)
        loadingView.isHidden = true
        activityIndicator.stopAnimating()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - UITableViewDataSource & Delegate Protocol Functions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (facilities?.count)! > 0 {
            return facilities!.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FacilityTableViewCell
        
        if (facilities?.count)! > 0 {
            configureCell(cell: cell, indexPath: indexPath)
            
        } else {
            
             showLoadingView()
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if facilities != nil {
            performSegue(withIdentifier: "detailed", sender: self)
        }
    }
    
    //Push information for selected facility into the detailed VC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailed" {
            let detailedVC = segue.destination as! DetailedViewController
            let indexPath = tableView.indexPathForSelectedRow!
            
            detailedVC.selectedFacility = facilities![indexPath.row]
        }
    }
    
    
    func configureCell(cell: FacilityTableViewCell, indexPath: IndexPath) {
        
        //Checks if any facilties have been downloaded into data array and populates label text
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
    
    
    func showLoadingView() {
        loadingView.isHidden = false
        activityIndicator.hidesWhenStopped =  true
        activityIndicator.startAnimating()
    }
    
}

