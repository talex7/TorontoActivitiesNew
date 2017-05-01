//
//  DetailedViewController.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-24.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import UIKit
import MapKit

class DetailedViewController: UIViewController {

    //Properties
    var selectedFacility: Facility!
    
    //Outlets
    @IBOutlet weak var facilityMapView: MKMapView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = checkValue(property: selectedFacility.locationName)
        addressLabel.text = checkValue(property: selectedFacility.address)
        phoneLabel.text = checkValue(property: selectedFacility.phone)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func checkValue(property: String?) -> String {
        if let p = property {
            return p
        } else {
            print("Nil Value")
            return "Nil Value"
        }
    }

}
