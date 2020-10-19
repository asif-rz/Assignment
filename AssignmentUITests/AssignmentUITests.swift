//
//  AssignmentUITests.swift
//  AssignmentUITests
//
//  Created by Asif Raza on 07/06/20.
//  Copyright © 2020 IU. All rights reserved.
//

import XCTest

class AssignmentUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUIFlow() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Kavanaugh Was Questioned by Police After Bar Fight in 1985"]/*[[".cells[\"Kavanaugh Was Questioned by Police After Bar Fight in 1985, By EMILY BAZELON and BEN PROTESS, The New York Times, 2018-10-01\"].staticTexts[\"Kavanaugh Was Questioned by Police After Bar Fight in 1985\"]",".staticTexts[\"Kavanaugh Was Questioned by Police After Bar Fight in 1985\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Chad Ludington’s Statement on Kavanaugh’s Drinking and Senate Testimony"]/*[[".cells[\"Chad Ludington’s Statement on Kavanaugh’s Drinking and Senate Testimony, By THE NEW YORK TIMES, The New York Times, 2018-09-30\"].staticTexts[\"Chad Ludington’s Statement on Kavanaugh’s Drinking and Senate Testimony\"]",".staticTexts[\"Chad Ludington’s Statement on Kavanaugh’s Drinking and Senate Testimony\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["Back"].tap()

    }
}
