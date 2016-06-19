
import XCTest
import Apodimark

private func stringForTest(_ name: String, result: Bool = false) -> String {
    let path = "/Users/loiclecrenier/Code/Apodimark/test-files/performance/" + name + ".txt"
    return try! String(contentsOf: URL(fileURLWithPath: path))
}

class PerformanceTests : XCTestCase {
 
    func testMixed1() {
        // Step 1: get the document
        let mixed1 = stringForTest("mixed1")
        var s = ""
        // Step 2: repeat the string until it reaches 10 million code points
        while s.utf16.count < 10_000_000 {
            s += mixed1
        }
        // Step 3: measure the time it takes to build the AST
        measure {
            _ = parsedMarkdown(source: s.utf16)
        }
        // Step 4: look at result, cry.
    }

    static var allTests : [(String, (PerformanceTests) -> () throws -> Void)] {
        return [("testMixed1", testMixed1)]
    }
}

