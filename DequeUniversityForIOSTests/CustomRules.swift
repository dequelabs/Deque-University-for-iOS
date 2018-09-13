import XCTest
import Attest

class CustomRules: XCTestCase {

    override func setUp() {
        super.setUp()

        //Add a custom rule implementation to custom rules
        Attest.customRules.append { (node: Rule.Result.Node, view: UIView) in

            let isEvil = view is UILabel

            //Add some helpful information to your rule so when it fails, people know why.
            node.checkedProps["The View is Evil"] = isEvil.description

            if view is UILabel {
                node.addCheckResult(impact: Impact.Minor, message: "We don't like static text in this application!")
            } else {
                //We could jst as easily NOT added a pass. A node with no checks is considered "inapplicable".
                node.addCheckResult(impact: Impact.Pass, message: "The view isn't a UILabel, we're good.")
            }
        }
    }

    override func tearDown() {

        //Custom rules are static and apply to every test.  If you're running a single process, clear them out!
        Attest.customRules.removeAll()

        super.tearDown()
    }

    /* Run an accessibility test that includes a custom rule implementation. */
    func testCustomRule() {

        //Up the verbosity on these reports just a little bit.
        Rule.Result.withDetails = true

        Attest.that(storyBoardName: "ColorContrast").isAccessible { (result) in
            //This is obviously going to fail hard, so don't assert!
            print(result.description)
        }

    }
}
