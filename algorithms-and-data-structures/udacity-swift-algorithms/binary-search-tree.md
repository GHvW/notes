# Binary Search Tree


### My Implementation
```swift
class Node {
    
    var value: Int
    var left: Node?
    var right: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class BST {
    
    var root: Node
    
    init(value: Int) {
        self.root = Node(value: value)
    }
    
    func search(_ value: Int) -> Bool {
        return searchHelper(root, value: value)
    }
    
    // create a node with the given value and insert it into the binary tree
    func insert(_ value: Int) {
        return insertHelper(root, value: value)
    }
    
    // helper method - use to implement a recursive search function
    func searchHelper(_ current: Node?, value: Int) -> Bool {
        guard let node = current else {
            return false
        }
        return node.value == value
            ? true
            : searchHelper(node.left, value: value) || searchHelper(node.right, value: value)
    }
    
    // helper method - use to implement a recursive insert function
    func insertHelper(_ current: Node, value: Int) {
        if value <= current.value {
            if let lhs = current.left {
                insertHelper(lhs, value: value)
            } else {
                current.left = Node(value: value)
            }
        } else {
            if let rhs = current.right {
                insertHelper(rhs, value: value)
            } else {
                current.right = Node(value: value)
            }
        }
    }
}

// Test cases
// Set up tree
let tree = BST(value: 4)

// Insert elements
tree.insert(2)
tree.insert(1)
tree.insert(3)
tree.insert(5)

// Check search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false
print(tree.search(5)) // Should be true
print(tree.search(3)) // Should be true
print(tree.search(8)) // Should be false
```

### Udacity Implementation