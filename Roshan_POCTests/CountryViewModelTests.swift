//
//  CountryViewModelTests.swift
//  Roshan_POCTests
//
//  Created by Roshan Dharpure on 23/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import XCTest
@testable import Roshan_POC
class CountryViewModelTests: XCTestCase {
    var country: Country?
    var countryViewModel: CountryViewModel!

    override func setUp() {
        super.setUp()
        //Test country viewModel initialization with empty model
        // country = Country.init(title: "America", details: [CountryDetails.init(title: "Place", description: "Nice to visit", imageHref: nil)])

        //Test country viewModel initialization with model
        country = Country.init(title: "America", details: [CountryDetails.init(title: "Place", description: "Nice to visit", imageHref: nil)])

        countryViewModel = CountryViewModel.init(country: country)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialization() {

        XCTAssertNotNil(countryViewModel, "The country view model should not be nil.")

        XCTAssertTrue(countryViewModel.countryData?.title ?? "NA" == country?.title ?? "NA", "The country view model title  should be equal to the country model title and if nil then must return NA.")

        XCTAssertTrue(countryViewModel.countryData?.details?.count == country?.details?.count, "The country details array should be equal to the country model details array.")

    }

}
