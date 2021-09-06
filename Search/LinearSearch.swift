import Foundation

func linearSearch<T: Equatable>(_ array: [T], _ object: T) -> Int? {
  for (index, obj) in array.enumerated() where obj == object {
    return index
  }
  return nil
}

// The code below can be used for testing

// var numbers = [10, 119, 13, 24, 53, 17, 31, 7, 19, 627, 47, 163, 37, 611, 29, 43, 51, 41, 32]
// if let searchIndex = linearSearch(numbers,31) {
//     print("Element found on index: \(searchIndex)")
// }
// else {
// print("Element not found")
// }
