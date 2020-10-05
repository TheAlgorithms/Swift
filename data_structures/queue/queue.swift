// Create simple queue
// Tejas Nanaware

struct Queue<T> {
  private var elements: [T] = []

  mutating func push(_ value: T) {
    elements.append(value)
  }

  mutating func pop() -> T? {
    guard !elements.isEmpty else { 
      return nil
    }
    return elements.removeFirst()
  }
}

var queue = Queue<String>()

queue.push("One")
queue.push("Two")
queue.push("Three")

print(queue.pop())
print(queue)
print(queue.pop())
print(queue)
print(queue.pop())
print(queue)
