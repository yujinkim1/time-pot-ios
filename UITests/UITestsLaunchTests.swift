//
//  UITestsLaunchTests
//  UITests
//
//  Created by Yujin Kim on 2024-03-25.
//  

import XCTest
@testable import TimePot_Debug

final class UITestsLaunchTests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
