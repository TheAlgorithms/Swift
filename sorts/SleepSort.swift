import Foundation

extension Array where Element == Int {
    func sleepSort() -> [Int] {
        let sortedArrayQueue = DispatchQueue(label: "sortedArrayQueue", attributes: .concurrent)
        var result = [Int]()
        let group = DispatchGroup()
        
        self.forEach {num in 
            group.enter()
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: TimeInterval(num))
                sortedArrayQueue.async(flags: .barrier) {
                    result.append(num)
                    group.leave()
                }
            }
        }
        group.wait()
        return result
    }
}

// Can be used for testing
/* let toSort = [4, 1, 5, 15, 10]
let sorted = toSort.sleepSort()
print(sorted)
*/
