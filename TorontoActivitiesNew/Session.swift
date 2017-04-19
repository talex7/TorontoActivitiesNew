//
//  Session.swift
//  TorontoActivitiesNew
//
//  Created by Thomas Alexanian on 2017-04-17.
//  Copyright © 2017 Thomas Alexanian. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Session: Object, Mappable {
    
    dynamic var date: String?
    dynamic var time: String?
    dynamic var sessionID: String?
    dynamic var courseID: String?
    dynamic var fullDate : Date?
    
    let course = LinkingObjects(fromType: Course.self, property: "sessions")

    
    //Session Identifier
    override class func primaryKey() -> String{
        return "sessionID"
    }
    
    
    //Mapping Functions
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        date <- map["Date"]
        time <- map["Time"]
        sessionID <- map["SessionID"]
        courseID <- map["CourseID"]
    }
}
