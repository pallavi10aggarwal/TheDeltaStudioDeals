//
//  TheDeltaStudioDealsTests.swift
//  TheDeltaStudioDealsTests
//
//  Created by Admin on 23/05/21.
//

import XCTest
@testable import TheDeltaStudioDeals

class TheDeltaStudioDealsTests: XCTestCase {

    struct DealsViewModel {
        let deals: [String]

        var hasDeals: Bool {
            return !deals.isEmpty
        }
    }
    
    
    /// A test case to validate our logic inside the `DealsViewModel`.
    final class DealsViewModelTests: XCTestCase {

        /// It should correctly reflect whether it has deals.
        func testHasDeals() {
            let viewModel = DealsViewModel(deals: ["NBA 2K21", "Dragon Ball Fighter Z  Ultimate Edition", "Assassins Creed Origins Gold Edition"])
            XCTAssertTrue(viewModel.hasDeals)
        }
    }

    

}
