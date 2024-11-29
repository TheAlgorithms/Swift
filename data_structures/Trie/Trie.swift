//
//  Trie.swift
//  
//
//  Created by Moon Jongseek on 11/27/24.
//

import Foundation

/// Trie(Prefix Tree)
///
/// A Trie/Prefix Tree is a kind of search tree used
/// to provide quick lookup of words/patterns in a set of words.
final class Trie {
    
    /// The child node dictionary
    ///
    /// Key is `String` type, and value is `Trie` type
    private var child: [String: Trie] = [:]
    
    /// A Boolean value indicating whether this node is leaf node.
    ///
    /// A Leaf node means that the child is empty.
    /// This property is `false` when the object is initialized.
    private var isLeaf: Bool = false
    
    public init() {
        
    }

    /// Inserts an word into the trie.
    ///
    /// The following example shows how to insert an word:
    ///
    ///     let trie = Trie()
    ///     trie.insert(word: "Trie")
    ///
    /// - Parameters:
    ///   - word: A string data to insert into trie.
    public func insert(word: String) {
        var node = self
        for s in word {
            let key = "\(s)"
            node.child[key] = (node.child[key] ?? Trie())
            node = node.child[key]!
        }
        node.isLeaf = true
    }
    
    /// Inserts the multiple words into the trie
    /// by using `insert(word: String)`.
    ///
    /// The following example shows how to insert multiple words:
    ///
    ///     let trie = Trie()
    ///     trie.insert(words: ["Trie", "Tree", "Swift"])
    ///
    /// - Parameters:
    ///   - words: An array containing string data to insert into trie.
    public func insert(words: [String]) {
        for word in words {
            self.insert(word: word)
        }
    }
    
    /// Deletes the word from the trie.
    ///
    /// The following example shows how to delete an word:
    ///
    ///     let trie = Trie()
    ///     trie.insert(words: ["Trie", "Tree", "Swift"])
    ///     print(trie.delete(word: "Trie"))
    ///     // Prints "true"
    ///     print(trie.delete(word: "Three"))
    ///     // Prints "false"
    ///     print(getAllWords())
    ///     // Prints "["Tree", "Swift"]"
    ///
    /// - Parameters:
    ///   - word: A string data to delete from trie.
    ///
    /// - Returns: A boolean indicating whether the deletion was successful.
    public func delete(word: String) -> Bool {
        var root = self
        var keys = Array(word).map(String.init)
        func _delete(_ node: Trie, _ depth: Int) -> Bool {
            if depth == word.count {
                guard node.isLeaf else {
                    return false
                }
                node.isLeaf = false
                return true
            }
            guard let c = node.child[keys[depth]] else {
                return false
            }
            let isDeleteChildNode = _delete(c, depth + 1)
            
            if isDeleteChildNode {
                if c.child.isEmpty && !c.isLeaf {
                    node.child[keys[depth]] = nil
                }
            }
            return isDeleteChildNode
        }
        return _delete(root, 0)
    }
    
    /// Delete the multiple words from the trie
    /// by using `delete(word: String)`.
    ///
    /// The following example shows how to delete multiple words:
    ///
    ///     let trie = Trie()
    ///     trie.insert(words: ["Trie", "Tree", "Swift"])
    ///     print(trie.delete(words: ["Trie", "Three"]))
    ///     // Prints "["Trie": true, "Three": false]"
    ///     print(getAllWords())
    ///     // Prints "["Tree", "Swift"]"
    ///
    /// - Parameters:
    ///   - words: An array containing string data to delete from trie.
    ///
    /// - Returns: A dictionary where the keys are strings representing each data item, and the values are booleans indicating whether the deletion was successful.
    public func delete(words: [String]) -> [String: Bool] {
        var result: [String: Bool] = [:]
        for word in words {
            result[word] = self.delete(word: word)
        }
        return result
    }
    
    /// Returns a Boolean value indicating whether the trie contains the
    /// given string data.
    ///
    /// This example checks to see whether a word is in the trie.
    ///
    ///     let trie = Trie()
    ///     trie.insert(words: ["Trie", "Tree", "Swift"])
    ///     print(trie.contains(word: "Trie"))
    ///     // Prints "true"
    ///     print(trie.contains(word: "Three"))
    ///     // Prints "false"
    ///
    /// - Parameters:
    ///   - words: The `String` element to find in the trie.
    ///
    /// - Returns: `true` if the trie contains a `String` element that satisfies
    ///   `word`; otherwise, `false`.
    public func contains(word: String) -> Bool {
        var node = self
        for s in word {
            guard let c = node.child["\(s)"] else {
                return false
            }
            node = c
        }
        return node.isLeaf
    }
    
    /// A array contained string value inserted in trie.
    ///
    /// The results are not affected by the order of insertion.
    /// The following example shows how to get all of string in trie:
    ///
    ///     let trie = Trie()
    ///     trie.insert(words: ["Trie", "Tree", "Swift"])
    ///     print(trie.getAllWords())
    ///     // Prints "["Trie", "Tree", "Swift"]"
    ///
    /// - Returns: An array of the string in trie.
    public func getAllWords() -> [String] {
        var node = self
        var result: [String] = []
        for c in node.child {
            if c.value.isLeaf {
                result += ["\(c.key)"]
            }
            result += c.value.getAllWords().map { "\(c.key)\($0)" }
        }
        return result
    }
}


let trie = Trie()
trie.insert(words: ["Swift", "Apple", "iPhone", "iPad", "iMac", "AppleWatch"])
print(trie.getAllWords())

print(trie.contains(word: "Apple"))
print(trie.delete(words: ["Apple", "iP"]))
print(trie.contains(word: "Apple"))
print(trie.getAllWords())

print(trie.contains(word: "AppleWatch"))
print(trie.contains(word: "iP"))
