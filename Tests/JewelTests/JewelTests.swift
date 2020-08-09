import XCTest
@testable import Jewel

final class JewelTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Jewel().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
