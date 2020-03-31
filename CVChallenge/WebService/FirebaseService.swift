//
//  FirebaseService.swift
//  CVChallenge
//
//  Created by Consultant on 3/30/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation
import Firebase

let fireb = FirebaseSource.shared

final class FirebaseSource {
    
    
    static let shared = FirebaseSource()
    private init() {}
    let ref = Database.database().reference()
    let childRef = Database.database().reference(withPath: "resume")

    
    func postData(resume: Resume)
    {
        let recipeItemRef = self.childRef.child("ibanavellaneda")
        
        recipeItemRef.setValue(resume.nsDictionary)
        
        print("Resume Saved")
    }
    
    //TODO: add function to recieve resume from Firebase
    
    func getData()
    {
        childRef.observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard let realValue = value else {return}
            let formattedValue = self.formatData(data: realValue)
            print("fetched resuime")
        }
    }
    
    private func formatData(data: NSDictionary)
    {
        for (_,val) in data
        {
            if let data = val as? NSDictionary{
                guard let summary = data["summary"] as? String,
                let topicsOfKnowledge = data["topicsOfKnowledge"] as? String,
                let work = data["pastExperience"] as? NSDictionary else {return}
                
                var pastExperience = [WorkExperience]()
                
                for (_,val) in work
                {
                    print(val)
                }
                
//                let resume = Resume(summary: summary, pastExperience: pastExperience, topicsOfKnowledge: topicsOfKnowledge)
            }
        
        }
    }
}
