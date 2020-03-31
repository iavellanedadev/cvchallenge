//
//  CVChallengeUITests.swift
//  CVChallengeUITests
//
//  Created by Consultant on 3/27/20.
//  Copyright © 2020 Consultant. All rights reserved.
//

import XCTest

class CVChallengeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMenuExample(){
        
        let app = XCUIApplication()
        app.launch()
        let menuButton = app.navigationBars["CVChallenge.MainView"].buttons["Menu"]
        menuButton.tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Key Technologies"]/*[[".cells.staticTexts[\"Key Technologies\"]",".staticTexts[\"Key Technologies\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        menuButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Previous Jobs"]/*[[".cells.staticTexts[\"Previous Jobs\"]",".staticTexts[\"Previous Jobs\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testEditSummary()
    {
        
        let app = XCUIApplication()
        app.launch()

       let menuButton = app.navigationBars["CVChallenge.MainView"].buttons["Edit"]
        menuButton.tap()

        app.staticTexts["Topics of Knowledge"].tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let textView = element.children(matching: .textView).element(boundBy: 1)
        textView.tap()
        textView.tap()
        
        let companyNameTextField = app.textFields["Company Name"]
        companyNameTextField.tap()
        companyNameTextField.tap()
        
        let month20xxMonth20xxTextField = app.textFields["(Month 20XX - Month 20XX)"]
        month20xxMonth20xxTextField.tap()
        month20xxMonth20xxTextField.tap()
        
        let textView2 = element.children(matching: .textView).element(boundBy: 2)
        textView2.tap()
        textView2.tap()
        
        app.navigationBars["CVChallenge.EditView"].buttons["Back"].tap()
        
 
        
    }

   
}
