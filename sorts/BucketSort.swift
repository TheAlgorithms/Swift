import Foundation

extension Array where Element == Int {
    func bucketSort(reverse: Bool = false) -> [Element] {
        var data = self
        
        guard data.count > 0 else { return [] }
        
        let max = data.max()!
        var buckets = [Int](repeating: 0, count: (max + 1))
        var out = [Int]()
        
        for i in 0..<data.count {
            buckets[data[i]] = buckets[data[i]] + 1
        }

        buckets.enumerated().forEach { index, value in
            guard value > 0 else { return }
            
            out.append(contentsOf: [Int](repeating: index, count: value))
        }

        return reverse == true ? out.reversed() : out
    }
}

// The code below can be used for testing

// let numberList : Array<Int> = [15, 2, 23, 11, 3, 9]
// let results: Array<Int> = numberList.bucketSort()
// print(results)