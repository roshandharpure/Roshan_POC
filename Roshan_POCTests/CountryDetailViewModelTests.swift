//
//  CountryViewModelTests.swift
//  Roshan_POCTests
//
//  Created by Roshan Dharpure on 22/05/19.
//  Copyright © 2019 Roshan Dharpure. All rights reserved.
//

import XCTest
@testable import Roshan_POC

class CountryDetailViewModelTests: XCTestCase {
    var countryDetailVM: CountryDetailViewModel!
    var countryDetails: CountryDetails!

    override func setUp() {
        super.setUp()
        //Test with empty model
        countryDetails = CountryDetails.init(title: nil, description: nil, imageHref: nil)

        //Test with model
        //countryDetails = CountryDetails.init(title: "America", description: "nice to visit", imageHref: "")

        countryDetailVM = CountryDetailViewModel.init(countryDetails: countryDetails)

    }

    override func tearDown() {
        super.tearDown()
    }

    func testInitializationWithModel() {

        let descriptionString =  countryDetails.description ?? "NA"
        let attributes: [NSAttributedStringKey: Any] = [ .font: UIFont.systemFont(ofSize: 18.0), .foregroundColor: UIColor.black]

        let descriptionAttributedString =  NSMutableAttributedString.init(string: descriptionString, attributes: attributes)

        XCTAssertNotNil(countryDetailVM, "The country detail view model should not be nil.")

        XCTAssertTrue(countryDetailVM.titleText == countryDetails.title ?? "NA", "The detail view model title  should be equal to the detail model title and if empty then must return NA.")

        XCTAssertTrue(countryDetailVM.descriptionText == descriptionAttributedString, "The detail view model description  should be equal to the detail model description and if empty then must return NA." )

    }

}
