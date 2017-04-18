//
//  NetworkRequestManager.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-17.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import RealmSwift

class NetworkRequestManager {
    
    func requestJSON() {
        
        Alamofire.request("https://toronto-activities.herokuapp.com/activities/1").responseArray {
            (response: DataResponse<[Facility]>) in
            
            guard let facilities = response.result.value else { return }
            let realm = try! Realm()
            
            try! realm.write {
                realm.add(facilities, update: true)
            }
        }
    }
    
}
