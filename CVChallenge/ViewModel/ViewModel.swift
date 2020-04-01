//
//  ViewModel.swift
//  CVChallenge
//
//  Created by Consultant on 3/24/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

protocol ViewDelegate: class
{
    func update()
}

class ViewModel
{
    weak var delegate: ViewDelegate?
    
    var resume: Resume?
    
    var menuItem: String?
}

extension ViewModel
{
    func getData()
    {
//        ResumeService().getResume{ [weak self] result in
//            switch result{
//            case .success(let rep):
//                if let resume = rep as? Resume{
//                    self?.resume = resume
//                    print("Topics of Knowledge: \(resume.topicsOfKnowledge)")
//
//                }
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
        
        fireb.getData{ [weak self] result in
            switch result {
            case .success(let resp):
                    self?.resume = resp
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func sendResume()
    {
        guard let editedResume = self.resume else {return}
        fireb.postData(resume: editedResume)
    }
}
