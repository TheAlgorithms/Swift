//
//  Permutations.swift
//  
//
//  Created by Moon Jongseek on 11/22/24.
//

/// Returns the array of permutation with the specified length.
///
/// Generates permutations in ascending order based on the index.
/// The following example shows how to generate permutaions for the `Int` type:
///
///     let permutationSet = permutations(data: [1,2,3,4], count: 2)
///     // [[1, 2], [1, 3], [1, 4], [2, 1], [2, 3], [2, 4], [3, 1], [3, 2], [3, 4], [4, 1], [4, 2], [4, 3]]
///
/// - Parameters:
///   - data: The array data to generate permutations.
///   - count: The number of each permutation elements.
///
/// - Returns: An array of permutations with length `count`. if `count` is greater than the length of `data` or less than 0, returns `nil`.
///
/// - Complexity: O(n! * n)
///
func permutations<T>(data: [T], count: Int) -> [[T]]? {
    guard data.count >= count && count >= 0 else { return nil }
    var result: [[T]] = []
    var buffer: [T] = []
    var visited = Array(repeating: false, count: data.count)
    
    func nextElement() {
        if buffer.count == count {
            result.append(buffer)
            return
        }
        for i in 0..<data.count {
            if !visited[i] {
                visited[i] = true
                buffer.append(data[i])
                nextElement()
                buffer.removeLast()
                visited[i] = false
            }
        }
    }
    nextElement()
    return result
}

let permutation_test0 = permutations(data: [1,2,3,4], count: 2)
print(permutation_test0)

let permutation_test1 = permutations(data: [1,2,3,4], count: -1)
print(permutation_test1)
