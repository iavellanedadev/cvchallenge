//
//  ResumeService.swift
//  CVChallenge
//
//  Created by Consultant on 3/24/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import Foundation

protocol GetResume {
    func getResume(completion: @escaping CompletionHandler)
}

final class ResumeService: APIClientDecodable, GetResume
{
    func getResume(completion: @escaping CompletionHandler)
    {
        guard let url = URL(string: "https://gist.githubusercontent.com/iavellanedadev/f6f02272e52e8e6a6761f64f83412039/raw/2f59d5a0e2fbf9f7bfea5c5193c76800d35deda0/resumecv.json")
            else {
                let error = ErrorInfo(errorCode: .badUrl, errorDescription: "URL is Malformed or Invalid", statusCode: 0)
                completion(.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url){dat, _, err in
            
            if let error = err {
                let error = ErrorInfo(errorCode: .badRequest, errorDescription: error.localizedDescription, statusCode: 0)
                completion(.failure(error))
                return
            }
            
            if let data = dat
            {
                do{
                   let response = try JSONDecoder().decode(Resume.self, from: data)

                    completion(.success(response))
                }catch{}
            }
        }.resume()
    }
    
//    func postResume(resume: Resume)
//    {
//        guard let url = URL(string: "https://gist.githubusercontent.com/iavellanedadev/f6f02272e52e8e6a6761f64f83412039/raw/2f59d5a0e2fbf9f7bfea5c5193c76800d35deda0/resumecv.json")
//                   else {
//                     print("Malformed URL")
//                   return
//               }
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
//        guard let httpBody = try? JSONSerialization.data(withJSONObject: resume, options: []) else {
//            return
//        }
//        request.httpBody = httpBody
//
//        let session = URLSession.shared
//        session.dataTask(with: request) { (data, response, error) in
//            if let response = response {
//                print(response)
//            }
//            if let data = data {
//                do {
//                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    print(json)
//                } catch {
//                    print(error)
//                }
//            }
//            }.resume()
//
//
//    }
}
