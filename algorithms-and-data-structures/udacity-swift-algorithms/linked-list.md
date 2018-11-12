# Linked List

### My Implementation
```swift
class Node {
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

class LinkedList {
    
    var head: Node?
    
    init(head: Node?) {
        self.head = head
    }
    
    func append(_ node: Node) {
        
        guard head != nil else {
            head = node
            return
        }
        
        var current = head
        while let _ = current?.next {
            current = current?.next
        }
        current?.next = node
    }
    
    // Get a node from a particular position.
    // Assume the first position is "1".
    // Return "nil" if position is not in the list.
    func getNode(atPosition position: Int) -> Node? {
        guard var node = head else {
            return nil
        }
        
        for _ in 1..<position {
            guard let next = node.next else {
                return nil
            }
            node = next
        }
        return node
    }
    
    // Insert a new node at the given position.
    // Assume the first position is "1".
    // Inserting at position 3 means between
    // the 2nd and 3rd nodes.
    func insertNode(_ node: Node, at position: Int) {
        if position == 1 {
            node.next = head
            head = node
            return
        }
        var ptr = head
        for _ in 2..<position {
            guard let next = ptr?.next else {
                return
            }
            ptr = next
        }
        
        node.next = ptr?.next
        ptr?.next = node
    }
    
    // Delete the first node with a given value.
    func deleteNode(withValue value: Int) {
        guard var node = head else {
            return
        }
        if node.value == value {
            head = node.next
            node.next = nil
            return
        }
        while let nextNode = node.next {
            if node.next?.value == value {
                node.next = node.next?.next
                node.next?.next = nil
                return
            }
            node = nextNode
        }
    }
}

// Test cases
// Set up some Nodes
let n1 = Node(value: 1)
let n2 = Node(value: 2)
let n3 = Node(value: 3)
let n4 = Node(value: 4)

// Start setting up a LinkedList
let ll = LinkedList(head: n1)
ll.append(n2)
ll.append(n3)

// Test getNode(atPosition:)
print(ll.head!.next!.next!.value) // Should print 3
print(ll.getNode(atPosition: 3)!.value) // Should also print 3
// Test insert
ll.insertNode(n4, at: 3)
print(ll.getNode(atPosition: 3)!.value) // Should print 4 now
// Test delete(withValue:)
ll.deleteNode(withValue: 1)
print(ll.getNode(atPosition: 1)!.value) // Should print 2 now
print(ll.getNode(atPosition: 2)!.value) // Should print 4 now
print(ll.getNode(atPosition: 3)!.value) // Should print 3
```