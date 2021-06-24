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

