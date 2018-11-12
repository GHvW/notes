# Graph Traversal

### My Implementation
```swift
// BFS - Queue based - travel each edge, then go to next node
// DFS - Stack based - go as deep as possible, then go back 1 (pop) when can't go any further
class Node {
    
    var value: Int?
    var edges: [Edge]
    var visited = false
    
    init(value: Int?) {
        self.value = value
        self.edges = []
    }
}

class Edge {
    
    var value: Int?
    var nodeFrom: Node?
    var nodeTo: Node?
    
    init(value: Int?, nodeFrom: Node?, nodeTo: Node?) {
        self.value = value
        self.nodeFrom = nodeFrom
        self.nodeTo = nodeTo
    }
}

class Graph {
    
    var nodes: [Node]
    var edges: [Edge]
    
    init(nodes: [Node], edges: [Edge]) {
        self.nodes = nodes
        self.edges = edges
    }
    
    // Create a recursive implementation.
    // Return a list of the node values.
//     func dfs(_ startNode: Node) -> [Int] {
//         return dfsHelper(startNode, visited: [])
//     }
    
    // Create an iterative implementation.
    // Return a list of the node values.
    func bfs(_ startNode: Node) -> [Int] {
        startNode.visited = true
        var queue: [Node] = [startNode]
        var vals: [Int] = []
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            vals.append(current.value ?? 0)
            for edge in current.edges {
                if let nextNode = edge.nodeTo, !nextNode.visited {
                    nextNode.visited = true
                    queue.append(nextNode)
                }
            }
        }
        return vals
    }
    
    // helper method - use to implement DFS recursively
    func dfsHelper(_ current: Node, visited: [Int]) -> [Int] {
        if current.visited || current.edges.isEmpty {
            return visited
        }
        current.visited = true
        let nodeVal = current.value ?? 0
        let newVisited = visited + [nodeVal]
        

        return current.edges.reduce(newVisited, { acc, edge  in
            guard let next = edge.nodeTo else {
              return acc
            }
            return dfsHelper(next , visited: acc)
        })
    }
    
    // creates a now with a given value and inserts it into the graph
    func insertNodeWithValue(_ value: Int) {
        let newNode = Node(value: value)
        nodes.append(newNode)
    }
    
    // inserts an edge between the "to" and "from" nodes with the given value
    func insertEdgeWithValue(_ newEdgeValue: Int, nodeFromValue: Int, nodeToValue: Int) {
        var fromFound: Node? = nil
        var toFound: Node? = nil
        
        for node in nodes {
            if nodeFromValue == node.value {
                fromFound = node
            }
            if nodeToValue == node.value {
                toFound = node
            }
        }
        
        if fromFound == nil {
            fromFound = Node(value: nodeFromValue)
            nodes.append(fromFound!)
        }
        if toFound == nil {
            toFound = Node(value: nodeToValue)
            nodes.append(toFound!)
        }
        
        let newEdge = Edge(value: newEdgeValue, nodeFrom: fromFound, nodeTo: toFound)
        fromFound?.edges.append(newEdge)
        toFound?.edges.append(newEdge)
        edges.append(newEdge)
    }
}

//Test cases
let graph = Graph(nodes: [], edges: [])
graph.insertEdgeWithValue(100, nodeFromValue: 1, nodeToValue: 2)
graph.insertEdgeWithValue(101, nodeFromValue: 1, nodeToValue: 3)
graph.insertEdgeWithValue(102, nodeFromValue: 1, nodeToValue: 4)
graph.insertEdgeWithValue(103, nodeFromValue: 3, nodeToValue: 4)

// print(graph.dfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
print(graph.bfs(graph.nodes[0])) // Should be [1, 2, 3, 4]
```