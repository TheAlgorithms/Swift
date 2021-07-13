import Foundation

extension Array where Element: Comparable {
	
	mutating func mergeSort(by comparison: (Element, Element) -> Bool) {
		guard self.count > 1 else {
			return
		}
		_mergeSort(from: 0, to: count - 1, by: comparison)
	}
	
	mutating private func _mergeSort(
		from left: Int,
		to right: Int,
		by comparison: (Element, Element) -> Bool
	) {
		if left < right {
			let mid = left + (right - left) / 2
			_mergeSort(from: 0, to: mid, by: comparison)
			_mergeSort(from: mid + 1, to: right, by: comparison)
			_merge(from: left, mid: mid, to: right, by: comparison)
		}
	}
	
	mutating private func _merge(
		from left: Int,
		mid: Int,
		to right: Int,
		by comparison: (Element, Element) -> Bool
	) {
		var copy = [Element](repeating: self[left], count: right - left + 1)
		var (p, q, k) = (left, mid + 1, 0)
		for _ in left ... right {
			if p > mid {
				copy[k] = self[q]
				k += 1
				q += 1
			} else if q > right {
				copy[k] = self[p]
				k += 1
				p += 1
			} else if comparison(self[p], self[q]) {
				copy[k] = self[p]
				k += 1
				p += 1
			} else {
				copy[k] = self[q]
				k += 1
				q += 1
			}
		}
		p = left
		for i in copy.indices {
			self[p] = copy[i]
			p += 1
		}
	}
	
	func mergeSorted(by comparison: (Element, Element) -> Bool) -> Array {
		var copy = self
		copy.mergeSort(by: comparison)
		return copy
	}
	
}

// The code below can be used for testing
var numberList = [15, 2, 23, 11, 3, 9]
debugPrint(numberList.mergeSorted(by: >))
numberList.mergeSort(by: <)
debugPrint(numberList)
