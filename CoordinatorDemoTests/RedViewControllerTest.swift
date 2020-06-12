//
//  RedViewControllerTest.swift
//  CoordinatorDemoTests
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import XCTest
@testable import CoordinatorDemo

class MockDelegate: RedViewControllerDelegate {
    func navigateToGreen() {
        XCTAssert(true)
    }
}

class RedViewControllerTest: XCTestCase {

    var redViewController: RedViewController?
    
    override func setUpWithError() throws {
        redViewController = RedViewController(coordinator: MockDelegate())
    }

    override func tearDownWithError() throws {
        redViewController = nil
    }

    func testNavigationOnButtonTap() throws {
        redViewController?.buttonTapped(sender: redViewController?.greenButton ?? UIButton())
    }

}
