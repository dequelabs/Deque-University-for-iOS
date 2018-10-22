import XCTest
import Attest

class SimpleTest: XCTestCase {

    /*
     The most simple test. Load the initial storyboard of main.
     The default isAccessible() call throws an exception on failure.
     */
    func testSimple() {
        RuleResult.withDetails = true
        Attest.that(storyBoardName: "Main").isAccessible()
    }
}
