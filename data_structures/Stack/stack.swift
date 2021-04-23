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

stack.push(10)
stack.push(20)
stack.push(30)

print(stack.count)
print(stack.peek)
print(stack.isEmpty)

print(stack.pop())
print(stack.pop())
print(stack.pop())
print(stack.isEmpty)
print(stack.count)
