//
//  Facility.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-17.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Facility: Object, Mappable {
    
    //Properties
    dynamic var accessibility: String?
    dynamic var address: String?
    dynamic var ageCategories: [String]?
    dynamic var ageGroups: [String]?
    dynamic var categories: [String]?
    dynamic var district: String?
    dynamic var latitude: String?
    dynamic var longitude: String?
    dynamic var locationName: String?
    dynamic var locationID: String?
    dynamic var postalCode: String?
    dynamic var phone: String?
    
    var courses: List<Course>?
    
    //Facility Identifiers
    override class func primaryKey() -> String{
        return "locationID"
    }
    
    
    //Mapping functions
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        accessibility <- map["Accessible"]
        address <- map["Address"]
        ageCategories <- map["AgeCat"]
        ageGroups <- map["AgeGroups"]
        categories <- map["Categories"]
        district <- map["District"]
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
        locationName <- map["LocationName"]
        locationID <- map["LocationID"]
        postalCode <- map["PostalCode"]
        phone <- map["Phone"]
        courses <- (map["Courses"], RealmListTransform<Course>())
    }
    
}
