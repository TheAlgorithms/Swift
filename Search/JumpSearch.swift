import Foundation

func jumpSearch<T: Comparable>(_ a: [T], key: T) -> Int? {
    let count = a.count
    var step = Int(sqrt(Double(count)))
    var previous = 0
    
    while a[min(step, count) - 1] < key {
        previous = step
        step += Int(sqrt(Double(count)))
        if previous >= count {
            return nil
        }
    }
    
    while a[previous] < key {
        previous += 1
        if previous == min(step, count) {
            return nil
        }
    }
    
    return a[previous] == key ? previous : nil
}


// The code below can be used for testing

//var numbers = [7, 10, 13, 17, 19, 24, 29, 31, 32, 37, 41, 43, 47, 51, 53, 119, 163, 611, 627]
//if let searchIndex = jumpSearch(numbers, key: 10) {
//    print("Element found on index: \(searchIndex)")
//}
//else {
//    print("Element not found")
//}


