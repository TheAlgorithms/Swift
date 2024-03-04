// A palindrome is a string that reads the same forwards and backwards.
//
// Examples: "level", "radar", "madam", "A man, a plan, a canal: Panama".

extension String {
    
    /// Iteratively comparing characters from the beginning and end of the string. Only include letters and numbers.
    /// - Complexity: O(n), without allocating new space.
    func isPalindrome() -> Bool {
        var leftIndex = startIndex
        var rightIndex = index(before: endIndex)
        
        while leftIndex < rightIndex {
            guard self[leftIndex].isLetter || self[leftIndex].isNumber else {
                leftIndex = index(after: leftIndex)
                continue
            }
            guard self[rightIndex].isLetter || self[rightIndex].isNumber else {
                rightIndex = index(before: rightIndex)
                continue
            }
            guard self[leftIndex].lowercased() == self[rightIndex].lowercased() else {
                return false
            }
            
            leftIndex = index(after: leftIndex)
            rightIndex = index(before: rightIndex)
        }
        
        return true
    }
}
