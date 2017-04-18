//
//  Course.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-17.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Course: Object, Mappable {
    
    dynamic var ageCategory: String?
    dynamic var ageGroup: String?
    dynamic var ageMax: String?
    dynamic var ageMin: String?
    dynamic var category: String?
    dynamic var courseID: String?
    dynamic var courseName: String?
    dynamic var programName: String?
    
    let facility = LinkingObjects(fromType: Facility.self, property: "courses")
    
    var sessions: List<Session>?
    
    
    //Course Identifier
    override class func primaryKey() -> String{
        return "courseID"
    }
    
    
    //Mapping functions
    required convenience init?(map: Map) {
        self.init()
    }
    
    
    func mapping(map: Map) {
        ageCategory <- map["AgeCat"]
        ageGroup <- map["AgeGroup"]
        ageMax <- map["AgeMax"]
        ageMin <- map["AgeMin"]
        category <- map["Category"]
        courseID <- map["CourseID"]
        courseName <- map["CourseName"]
        programName <- map["ProgramName"]
        sessions <- (map["Sessions"], RealmListTransform<Session>())
        
    }
    
}
