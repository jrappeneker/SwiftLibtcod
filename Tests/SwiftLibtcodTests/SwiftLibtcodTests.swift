import XCTest
@testable import SwiftLibtcod

final class SwiftLibtcodTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftLibtcod().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
