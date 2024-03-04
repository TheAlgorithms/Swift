// A palindrome is a string that reads the same forwards and backwards.
//
// Examples: "level", "radar", "madam", "A man, a plan, a canal: Panama".

extension String {
    
    /// Using the `reverse()` method to reverse the string and comparing it with the original. Only include letters and numbers.
    /// - Complexity: O(n), with allocating O(n) space.
    func isPalindrome() -> Bool {
        let input = lowercased().filter { $0.isLetter || $0.isNumber }
        return input == String(input.reversed())
    }
}
