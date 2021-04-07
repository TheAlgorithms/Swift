import Foundation

func insertionSort<T>(_ array: [T], by comparison: (T, T) -> Bool) -> [T] {
    guard array.count > 1 else { return array }
    
    var sortedArray = array
    
    for index in 1..<sortedArray.count {
        var currentIndex = index
        let temp = sortedArray[currentIndex]
        
        while currentIndex > 0, comparison(temp, sortedArray[currentIndex - 1]) {
            sortedArray[currentIndex] = sortedArray[currentIndex - 1]
            currentIndex -= 1
        }
        sortedArray[currentIndex] = temp
    }
    
    return sortedArray
}

// The code below can be used for testing

/*
let numbers = [10, 1, 3, 8, 4, 2]

print(insertionSort(numbers, by: >))
print(insertionSort(numbers, by: <))

let names = ["Jack", "Paul", "Olivia", "Emma", "Michael"]

print(insertionSort(names, by: >))
print(insertionSort(names, by: <))
*/
