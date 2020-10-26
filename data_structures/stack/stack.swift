/*
* This class implements a Stack algorithm.
* LIFO(Last In First Out)
* Eunbee Kim
*/

struct Stack<T>{

  private var elements : [T] = []

  mutating func push(_ value : T){
    elements.append(value)
  }

  mutating func pop()-> T{
    return elements.removeLast()
  }

}

var stack = Stack<Int>()

stack.push(5)
stack.push(8)
stack.push(2)
stack.push(9)

print(stack)
print(stack.pop())
print(stack)

stack.push(10)
print(stack)

/*
* print
* Stack<Int>(elements: [5, 8, 2, 9])
* 9
* Stack<Int>(elements: [5, 8, 2])
* Stack<Int>(elements: [5, 8, 2, 10])
*/