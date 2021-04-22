import Foundation

public struct Stack<T> {
    private var elements = [T]()
    
    public mutating func push(_ element: T) {
        elements.append(element)
    }
    
    public mutating func pop() -> T? {
        return elements.popLast()
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var peek: T? {
        return elements.last
    }
}

// The code below can be used for testing

var stack = Stack<Int>()

stack.push(1)
stack.push(2)
stack.push(3)
stack.count
stack.peek
stack.isEmpty

print(stack.pop())
print(stack.pop())
print(stack.pop())
stack.isEmpty
stack.count
