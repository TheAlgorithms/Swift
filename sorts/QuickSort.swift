import Foundation

extension Array where Element: Comparable {
    /// Sorts the array using the QuickSort algorithm in place.
    ///
    /// The QuickSort algorithm sorts the array by first choosing a pivot. This pivot is used to rearrange
    /// all elements, moving the smaller ones to the left of it. This operation is then recursevely applied
    /// to the subarrays formed around the pivot.
    mutating func quickSort() {
        guard count > 1 else {
            return
        }
        
        _quickSort(from: 0, to: count - 1)
    }
    
    mutating private func _quickSort(from left: Int, to right: Int) {
        guard left < right, right - left > 0 else {
            return
        }
        
        let pivotIndex = partition(from: left, to: right)
        _quickSort(from: left, to: pivotIndex - 1)
        _quickSort(from: pivotIndex + 1, to: right)
    }
    
    /// This method is where the pivot is chosen, so the smaller elements get moved to the left,
    /// and the bigger ones to the right.
    mutating private func partition(from left: Int, to right: Int) -> Int {
        /// Chooses the pivot, which in this case is always the first element, which is not very efficient.
        let pivotIndex = left
        swapAt(pivotIndex, right)
        
        let pivot = self[right]
        var i = left
        
        for j in i ..< right {
            // If the element is smaller than the pivot, move it to the left.
            if self[j] <= pivot {
                swapAt(i, j)
                i += 1
            }
        }
        
        // Move the pivot to its right sorted position.
        swapAt(i, right)
        
        return i
    }
    
    /// Returns a sorted version of this array using the QuickSort algorithm.
    func quickSorted() -> Self {
        var copy = self
        
        copy.quickSort()
        
        return copy
    }
}

// Use the following code to test it:
// var numbers = [1002, 42, 55, 124, 205]
// debugPrint(numbers.quickSorted())
//
// numbers.quickSort()
// debugPrint(numbers)
//
// The console should print:
// [42, 55, 124, 205, 1002]
// [42, 55, 124, 205, 1002]
