import Foundation
import XCTest
@testable import Algorithms

final class SortTests: XCTestCase {
    private let testCases = [
        [[1,3,4,2,5], [1,2,3,4,5]],
        [[],[]]
    ]
    
    func testQuickSort() {
        for testCase in testCases {
            if !isArray(testCase[0].quickSorted(), equalTo: testCase[1]) {
                XCTFail()
            }
        }
    }
    
    func testBubble() {
        for testCase in testCases {
            if !isArray(testCase[0].bubbleSort(), equalTo: testCase[1]) {
                XCTFail()
            }
        }
    }
    
    func testInsertionSort() {
        for testCase in testCases {
            if !isArray(insertionSort(testCase[0], by: <), equalTo: testCase[1]) {
                XCTFail()
            }
        }
    }
    
    func testSelectionSort() {
        for testCase in testCases {
            if !isArray(testCase[0].selectionSort(), equalTo: testCase[1]) {
                XCTFail()
            }
        }
    }
    
    private func isArray(_ one: Array<Int>, equalTo another: Array<Int>) -> Bool {
        if one.count != another.count {
            return false
        }
        for i in stride(from: 0, to: one.count, by: 1) {
            if one[i] != another[i] {
                return false
            }
        }
        return true
    }
}
