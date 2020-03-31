//
//  ResumeModel.swift
//  CVChallenge
//
//  Created by Consultant on 3/24/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

struct Resume: Codable
{
    var summary: String
    var pastExperience: [WorkExperience]
    var topicsOfKnowledge: String
    
    var dictionary: [String: Any] {
        return ["summary": summary,
                "pastExperience": pastExperience.map({$0.nsDictionary}),
                "topicsOfKnowledge": topicsOfKnowledge]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}

struct WorkExperience : Codable
{
    var companyName: String
    var roleName: String
    var dateFromTo: String
    var mainResponsibilities: [String]
    
    var dictionary: [String: Any] {
        return ["companyName": companyName,
                "roleName": roleName,
                "dateFromTo": dateFromTo,
                "mainResponsibilities": mainResponsibilities
        ]
    }
    
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }

}
