//
//  PrefixSum.swift
//
//
//  Created by Moon Jongseek(Rey) on 11/10/24.
//

import Foundation

/// A class representing a prefix sum.
///
/// The type of the elements in the sequence, constrained to types that conform to
/// `AdditiveArithmetic` and `Hashable` such as `Int` and`Double`.
final class PrefixSum<T: AdditiveArithmetic & Hashable> {
    /// Origin Array.
    public var array: [T]
    /// The Prefix Sum Array.
    public var prefixSum: [T]
    
    /// Initializes a new prefix sum with the array.
    ///
    /// - Parameters:
    ///   - array: The array with `AdditiveArithmetic` & `Hashable` type data.
    init(array: [T]) {
        let length = array.count
        self.array = array
        self.prefixSum = Array(repeating: T.zero, count: length)
        if length > 0 {
            self.prefixSum[0] = array[0]
            for i in 1..<length {
                self.prefixSum[i] = self.prefixSum[i-1] + array[i]
            }
        }
    }
    
    /// The function returns the sum of array from the start to the end indexes.
    ///
    /// The following example shows a specified range sum for the `Int` type:
    ///
    ///     let prefixSum = PrefixSum<Int>(array: [8,3,4,2,6,7])
    ///     prefixSum.getSum(start: 0, end: 3)
    ///     // 17
    ///     prefixSum.getSum(start: -1, end: 3)
    ///     // nil
    ///
    /// - Parameters:
    ///   - start: The starting index of the range for the sum calculation.
    ///   - end: The ending index of the range for the sum calculation (inclusive).
    ///
    /// - Returns: The sum of elements from `start` to `end` as an optional value of type `T`.
    ///   Returns `nil` if the range is invalid or out of bounds.
    ///
    /// - Complexity: O(1)
    ///
    public func getSum(start: Int, end: Int) -> T? {
        let length = array.count
        guard (0..<length ~= start) && (0..<length ~= end) && (start <= end) else {
            return nil
        }
        return self.prefixSum[end] - (start == 0 ? T.zero : self.prefixSum[start - 1])
    }
    
    /// Checks if there exists a contiguous subarray with a sum equal to the target value.
    ///
    /// The following example shows how to check for the presence of
    /// a specified target sum within a contiguous subarray for the `Int` type:
    ///
    ///     let prefixSum = PrefixSum<Int>(array: [8,3,4,2,6,7])
    ///     prefixSum.containsSum(targetSum: 9)
    ///     // true
    ///     prefixSum.containsSum(targetSum: 31)
    ///     // false
    ///
    /// - Parameters:
    ///   - targetSum: The target sum to check for within the prefix sums.
    ///
    /// - Returns: `true` if there is a contiguous subarray with a sum equal to `targetSum`; otherwise, `false`.
    ///
    /// - Complexity: O(n)
    ///
    public func containsSum(targetSum: T) -> Bool {
        var sumSet: Set<T> = [T.zero]
        for sumItem in self.prefixSum {
            if sumSet.contains(sumItem - targetSum) {
                return true
            }
            sumSet.insert(sumItem)
        }
        return false
    }
}
