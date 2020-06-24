//
//  RedViewControllerTest.swift
//  CoordinatorDemoTests
//
//  Created by Ayas Sahu on 6/11/20.
//  Copyright © 2020 VSCO. All rights reserved.
//

import XCTest
@testable import CoordinatorDemo

class MockDelegate: LoginViewControllerDelegate {
    func onLoginTapped() {
        XCTAssert(true)
    }
}

class RedViewControllerTest: XCTestCase {

    var loginViewController: LoginViewController?
    
    override func setUpWithError() throws {
        loginViewController = LoginViewController(coordinator: MockDelegate())
    }

    override func tearDownWithError() throws {
        loginViewController = nil
    }

    func testNavigationOnButtonTap() throws {
        loginViewController?.onLoginTapped(sender: loginViewController?.loginButton ?? UIButton())
    }

}
