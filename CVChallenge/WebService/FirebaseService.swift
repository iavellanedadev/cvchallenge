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
    
    func getData(completion: @escaping (Result<Resume, Error>) -> Void)
    {
        childRef.observeSingleEvent(of: .value) { (snapshot) in
            let value = snapshot.value as? NSDictionary
            guard let realValue = value else {return}
            let formattedValue = self.formatData(data: realValue)
            
            guard let resume = formattedValue else {
                let error = ErrorInfo(errorCode: .parsingFailed, errorDescription: "Failed to Parse Data from Firebase", statusCode: 0)
                completion(.failure(error))
                return
            }
            
            completion(.success(resume))
        }
    }
    
    private func formatData(data: NSDictionary) -> Resume?
    {
        for (_,val) in data
        {
            if let data = val as? NSDictionary{
                guard let summary = data["summary"] as? String,
                let topicsOfKnowledge = data["topicsOfKnowledge"] as? String,
                    let work = data["pastExperience"] as? NSArray else {return nil}
                
                var pastExperience = [WorkExperience]()
                
                for i in work{
                    guard let exp = i as? [String:Any] else {return nil}
                    let workExp = WorkExperience(companyName: exp["companyName"] as! String, roleName: exp["roleName"] as! String, dateFromTo: exp["dateFromTo"] as! String, mainResponsibilities: exp["mainResponsibilities"] as! [String])
                    
                    pastExperience.append(workExp)
                }
                
                return Resume(summary: summary, pastExperience: pastExperience, topicsOfKnowledge: topicsOfKnowledge)
            }
        
        }
        return nil
    }
}
