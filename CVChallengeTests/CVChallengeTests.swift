//
//  CVChallengeTests.swift
//  CVChallengeTests
//
//  Created by Consultant on 3/24/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import XCTest
@testable import CVChallenge

class CVChallengeTests: XCTestCase {

    var mockService: MockCVChallengeService!
    override func setUp() {
        mockService = MockCVChallengeService()
    }

    func testDecoder()
    {
        let mockData = mockService.getMockData()
        guard let resume = mockData else {return}
        XCTAssertGreaterThan(resume.summary.count, 0)
    }
    
    class MockCVChallengeService: APIClientDecodable {
        var mockDataFileName = "mockData"
        func gethistoricalLaunches(completion: @escaping CompletionHandler) {
            if let resume = self.getMockData() {
              completion(.success(resume))
            }else {
                let errorInfo = ErrorInfo(errorCode: .unknown, errorDescription: "unknown error", statusCode: 0)
                completion(.failure(errorInfo))
            }
        }
        func getMockData()-> Resume? {
           
            let bundle = Bundle(for:CVChallengeTests.self)
            if let url =  bundle.url(forResource: mockDataFileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let jsonData = self.decodeServiceResults(Resume.self, result: data)
                    return jsonData
                  } catch {
                    print("error:\(error)")
                    return nil
                }
            }
            return nil
        }
    }

}
