# Binary Tree

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

class BinaryTree {
    
    var root: Node
    
    init(rootValue: Int) {
        self.root = Node(value: rootValue)
    }
    
    // Return true if the value is in the tree, otherwise return false
    func search(_ value: Int) -> Bool {
        return preorderSearch(root, value: value)
    }
    
    // Return a string containing all tree nodes as they are visited in a pre-order traversal.
    func printTree() -> String {
        return preorderPrint(root, traverse: "")!
    }
    
    // Helper method - use to create a recursive search solution.
    //pre-order == depth first search counting each node as you go
    func preorderSearch(_ start: Node?, value: Int) -> Bool {
        guard let node = start else {
            return false
        }
        
        return node.value == value
            ? true
            : preorderSearch(node.left, value: value) || preorderSearch(node.right, value: value)
    }
    
    // Helper method - use to construct a string representing the preordered nodes
    func preorderPrint(_ start: Node?, traverse: String) -> String? {
        guard let node = start else {
            return traverse
        }
        let trav = traverse + "\(node.value)"
        guard let lhs = preorderPrint(node.left, traverse: trav) else {
            return trav
        }
        guard let lhsrhs = preorderPrint(node.right, traverse: lhs) else {
            return lhs
        }
        
        return lhsrhs
    }
}

// Test cases
// Set up tree
let tree = BinaryTree(rootValue: 1)
tree.root.left = Node(value: 2)
tree.root.right = Node(value: 3)
tree.root.left?.left = Node(value: 4)
tree.root.left?.right = Node(value: 5)

// Test search
print(tree.search(4)) // Should be true
print(tree.search(6)) // Should be false
// Test printTree
print(tree.printTree()) // Should be 1-2-4-5-3
```

### Udacity Implementation

```swift
```