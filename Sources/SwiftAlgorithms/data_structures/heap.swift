struct Heap<Element> {
    let compare: (Element, Element) -> Bool
    private var items : [Element]

    init(_ items : [Element], compare: @escaping (Element, Element) -> Bool) {
        self.compare = compare
        self.items = items
        for index in (0 ..< count / 2).reversed() {
            heapify(index)
        }
    }

    /// The minimum item on this heap or nil if the heap is empty
    var min: Element? {
        return items.first
    }

    /// The number of items on this heap
    var count: Int {
        return items.count
    }

    /// true if this heap is empty
    var isEmpty: Bool {
        return items.isEmpty
    }

    /// Removes and returns the minimum item from the heap.
    /// - returns: The minimum item from the heap or nil if the heap is empty.
    mutating func extractMin() -> Element? {
        guard let result = items.first else { return nil }

        items.removeFirst()
        heapify(0)
        return result

    }

    /// Inserts a new item into this heap
    /// - parameter item: The new item to insert
    mutating func insert(item : Element) {
        items.append(item)
        var i = items.count - 1
        while i > 0 && compare(items[i], items[parent(i)]) {
            items.swapAt(i, parent(i))
            i = parent(i)
        }
    }

    /// Restores the heap property starting at a given index
    /// - parameter index: The index to start at
    private mutating func heapify(_ index : Int) {
        var minimumIndex = index
        if left(index) < count && compare(items[left(index)], items[minimumIndex]) {
            minimumIndex = left(index)
        }

        if right(index) < count && compare(items[right(index)], items[minimumIndex]) {
            minimumIndex = right(index)
        }

        if minimumIndex != index {
            items.swapAt(minimumIndex, index)
            heapify(minimumIndex)
        }
    }

    /// Returns the index of the left child of an item
    private func left(_ index : Int) -> Int {
        return 2 * index + 1
    }

    /// Returns the index of the right child of an item
    private func right(_ index: Int) -> Int {
        return 2 * index + 2
    }

    /// Returns the index of the parent of an item
    private func parent(_ index: Int) -> Int {
        return (index - 1) / 2
    }
}


extension Heap: ExpressibleByArrayLiteral where Element: Comparable {
    init(arrayLiteral elements: Element...) {
        self.init(elements, compare: <)
    }

    init(_ elements: [Element]) {
        self.init(elements, compare: <)
    }
}
