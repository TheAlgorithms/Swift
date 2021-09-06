import Foundation

public func binarySearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    var lowerBound = 0
    var upperBound = a.count
    while lowerBound < upperBound {
        let midIndex = lowerBound + (upperBound - lowerBound) / 2
        if a[midIndex] == key {
            return midIndex
        } else if a[midIndex] < key {
            lowerBound = midIndex + 1
        } else {
            upperBound = midIndex
        }
    }
    return nil
}
// The code below can be used for testing

// var numbers = [7, 10, 13, 17, 19, 24, 29, 31, 32, 37, 41, 43, 47, 51, 53, 119, 163, 611, 627]
// if let searchIndex = binarySearch(numbers, key: 10) {
//     print("Element found on index: \(searchIndex)")
// }
// else {
// print("Element not found")
// }

