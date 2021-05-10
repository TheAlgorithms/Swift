import Foundation

public class TreeNode<T> {
    public var value: T

    public weak var parent: TreeNode?
    public var children = [TreeNode<T>]()

    public init(value: T) {
        self.value = value
    }

    public func addChild(_ node: TreeNode<T>) {
        children.append(node)
        node.parent = self
    }
}

/* Checks the node's value property, if there is no match, check the child nodes.
Repeat the same process recursively */
extension TreeNode where T: Equatable {
    func search(_ value: T) -> TreeNode? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value) {
                return found
            }
        }
        return nil
    }
}

// The code below can be used for testing
let tree = TreeNode<String>(value: "animals")

let reptilesNode = TreeNode<String>(value: "reptiles")
let mammalsNode = TreeNode<String>(value: "mammals")

let lizardsNode = TreeNode<String>(value: "lizards")
let snakesNode = TreeNode<String>(value: "snakes")

let dogsNode = TreeNode<String>(value: "dogs")
let humansNode = TreeNode<String>(value: "humans")

tree.addChild(reptilesNode)
tree.addChild(mammalsNode)

reptilesNode.addChild(lizardsNode)
reptilesNode.addChild(snakesNode)

mammalsNode.addChild(dogsNode)
mammalsNode.addChild(humansNode)

print(tree.search("humans")?.value)
print(tree.search("lizards")?.value)
print(tree.search("dragons")?.value)
