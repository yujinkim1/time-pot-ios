//
//  UITests
//  UITests
//
//  Created by Yujin Kim on 2024-03-25.
//  

import XCTest
@testable import TimePot_Debug

final class UITests: XCTestCase {
    func testBackButton() throws {
        let app = XCUIApplication()
        app.launch()
        
        let backButton = app.buttons["backButton"]
        XCTAssertTrue(backButton.exists)
        
        backButton.tap()
        backButton.tap()
    }
}
