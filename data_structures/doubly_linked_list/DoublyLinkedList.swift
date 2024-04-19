import Foundation

public class Node<Value> {
    public var value: Value?
    public var next: Node?
    public var prev: Node?
    
    public init(value: Value? = nil, next: Node<Value>? = nil, prev: Node<Value>? = nil) {
        self.value = value
        self.next = next
        self.prev = prev
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next: Node<Value> = self.next else {
            return "\(String(describing: value))"
        }
        return "\(String(describing: value)) <-> \(String(describing: next)) "
    }
}

public struct DoublyLinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public var count: Int = 0
    
    public var isEmpty: Bool {
        return head == nil
    }

    public mutating func push(_ value: Value) {
        let new: Node<Value> = Node(value: value, next: head)
        if head != nil { head!.prev = new }
        head = new
        if tail == nil { tail = head }
        count += 1
    }
    
    public mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail!.next = Node(value: value, prev: tail)
        tail = tail!.next
        count += 1
    }

    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        var new: Node<Value> = Node(value: value, next: node.next, prev: node)
        node.next?.prev = new
        node.next = new
        count += 1
        return node.next!
    }

    @discardableResult
    public mutating func insert(_ value: Value,
                                before node: Node<Value>) -> Node<Value> {
        guard head !== node else {
            push(value)
            return head!
        }
        var new: Node<Value> = Node(value: value, next: node, prev: node.prev)
        node.prev?.next = new
        node.prev = new
        count += 1
        return node.prev!
    }

    public func node(at index: Int) -> Node<Value>? {
        guard index > -1 || index < count else { return nil }
        
        let startFromTail: Bool = index > count / 2
        var currentNode: Node<Value>? = startFromTail ? tail : head
        var currentIndex: Int = startFromTail ? count - 1 : 0
        var change: Int = startFromTail ? -1 : 1
        
        while currentNode != nil {
            if currentIndex == index { break }
            currentNode = startFromTail ? currentNode!.prev : currentNode!.next
            currentIndex += change
        }
        
        return currentNode
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        defer {
            head = head?.next
            count -= 1
            if isEmpty {
                tail = nil
            } else {
                head!.prev = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value? {
        defer {
            tail = tail?.prev
            count -= 1
            if isEmpty {
                head = nil
            } else {
                tail!.next = nil
            }
        }
        return tail?.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next != nil {
                count -= 1
            }
            if node.next === tail {
                tail = node
            }
            if let next2node: Node<Value> = node.next?.next {
                next2node.prev = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }

    @discardableResult
    public mutating func remove(before node: Node<Value>) -> Value? {
        defer {
            if node.prev != nil {
                count -= 1
            }
            if node.prev === head {
                head = node
            }
            if let prev2node: Node<Value> = node.prev?.prev {
                prev2node.next = node
            }
            node.prev = node.prev?.prev
        }
        return node.prev?.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head: Node<Value> = self.head else {
          return "Empty list"
        }
        return String(describing: head)
      }
}

// Here are testing scenarios to run in a Swift playground

/*
var list = DoublyLinkedList<Int>()

list.push(4)
list.push(2)
list.push(1)

list.append(6)

var n = list.node(at: 2)

list.insert(5, after: n!)
list.insert(3, before: n!)

print(list)

print(list.pop()!)
print(list.removeLast()!)

print(list.remove(after: n!)!)
print(list.remove(before: n!)!)

print(list.count)
*/
