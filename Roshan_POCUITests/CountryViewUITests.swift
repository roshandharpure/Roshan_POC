//
//  Roshan_POCUITests.swift
//  Roshan_POCUITests
//
//  Created by Roshan Dharpure on 16/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import XCTest

class CountryViewUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }

    func testTableInteraction() {
        app.launch()

        let countryTableView = app.tables["table--countryDetailTableView"]

        XCTAssertTrue(countryTableView.exists, "The country tableview exists")
        let tableCells = countryTableView.cells

        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            let promise = expectation(description: "Wait for table cells")

            for i in stride(from: 0, to: count, by: 1) {
                // Take the first cell and verify that it exists
                let tableCell = tableCells.element(boundBy: i)

                XCTAssertTrue(tableCell.exists, "The \(i) cell is in place on the table")

                if i == (count - 1) {
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 40, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")

        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

}
