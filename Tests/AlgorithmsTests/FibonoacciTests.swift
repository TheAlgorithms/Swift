    import XCTest
    @testable import Algorithms
    @testable import DataStructures

    final class FibonacciTests: XCTestCase {
        var testCases = [1: 1, 2: 1, 3: 2, 4: 3, 5: 5, 6: 8, 7: 13, 8: 21]
        func testRecursiveFibonacci() {
            for (key,value) in testCases {
                if fibonacci(key) != value {
                    XCTFail()
                }
            }
        }
    }
