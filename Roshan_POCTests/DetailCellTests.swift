//
//  DetailCellTests.swift
//  Roshan_POCTests
//
//  Created by Roshan Dharpure on 23/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import XCTest
@testable import Roshan_POC
class DetailCellTests: XCTestCase {
    var cell: DetailCell?
    var countryDetailViewModel: CountryDetailViewModel?

    override func setUp() {
        super.setUp()
        cell = DetailCell.init(style: .default, reuseIdentifier: detailCellId)

        countryDetailViewModel = CountryDetailViewModel.init(countryDetails: CountryDetails.init(title: nil, description: "Beavers are second only to humans in their ability to manipulate and change their environment. They can measure up to 1.3 metres long. A group of beavers is called a colony", imageHref: "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"))

        cell?.countryDetailViewModel = countryDetailViewModel
    }

    override func tearDown() {
        super.tearDown()

    }

    func testCellTitleReturnProperValue() {
        XCTAssertEqual(cell?.lblTitle.text!, countryDetailViewModel?.titleText, "Detail cell title lable text must be equal to view Model's title text")

        XCTAssertEqual(cell?.lblDescription.attributedText!, countryDetailViewModel?.descriptionText, "Detail cell description lable text must be equal to view Model's description text")

    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
