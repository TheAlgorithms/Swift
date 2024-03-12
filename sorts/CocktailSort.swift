
/*
 Cocktail Sort (or Cocktail shaker sort) is a variation of Bubble sort.
 The Bubble sort algorithm always traverses elements from left and moves the largest element
 to its correct position in first iteration and second largest in second iteration and so on.
 Cocktail Sort traverses through a given array in both directions alternatively.
*/

import Foundation

func cocktailSort<T: Comparable>(_ a: [T]) -> [T] {
    var list = a
    var swapped = true
    var start = 0
    var end = list.count - 1

    while (swapped) {
        swapped = false

        for i in start..<end {
            if (list[i] > list[i + 1]) {
                list.swapAt(i, i+1)
                swapped = true
            }
        }

        if (!swapped) {
            break
        }
        swapped = false
        end -= 1

        for index in stride(from: end-1, through: start, by: -1) {
            if (list[index] > list[index + 1]) {
                list.swapAt(index, index+1)
                swapped = true
            }
        }
        start += 1
    }
    
    return list
}

// The code below can be used for testing

//var numbers = [2, -4, 4, 6, 1, 12, 9, 0]
//numbers = cocktailSort(numbers)
//print(numbers)
