// MARK: - Basic requirement
struct Edge {
    let from: Int
    let to: Int
}

public class Node {
    var val: Int
    var neighbors: [Int]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

// MARK: - BFS implementation
func testBFS(edges: [Edge]) {
    
    var graph = [Int: Node]()
    for edge in edges {
        graph[edge.from] = Node(edge.from)
        graph[edge.to] = Node(edge.to)
    }
    for edge in edges {
        graph[edge.from]?.neighbors.append(edge.to)
        graph[edge.to]?.neighbors.append(edge.from)
    }
    var visited: [Bool] = Array(repeating: false, count: graph.count + 1)
    var nodesOfCurrentLevel: [Int] = []
    
    for node in 1...graph.count {
        if visited[node] == false {
            nodesOfCurrentLevel.append(node)
            while(nodesOfCurrentLevel.isEmpty == false) {
                var nodesOfNextLevel: [Int] = []
                let sizeOfQueue = nodesOfCurrentLevel.count
                for index in 0..<sizeOfQueue {
                    let currNode = nodesOfCurrentLevel[index]
                    if(visited[currNode] == true){
                        continue
                    }
                    print("\(currNode) ")
                    visited[currNode] = true
                    guard let neighbors = graph[currNode]?.neighbors else { continue }
                    for neigh in neighbors {
                        if visited[neigh] == false {
                            nodesOfNextLevel.append(neigh)
                        }
                    }
                }
                nodesOfCurrentLevel = nodesOfNextLevel
            }
        }
    }
}

// MARK: - Input Graph
func setup() {
    let edges = [
        Edge(from: 1, to: 2),
        Edge(from: 1, to: 4),
        Edge(from: 2, to: 3),
        Edge(from: 2, to: 4),
        Edge(from: 2, to: 5),
        Edge(from: 3, to: 5),
        Edge(from: 4, to: 5),
        Edge(from: 4, to: 6),
        Edge(from: 5, to: 6),
        Edge(from: 5, to: 6),
        Edge(from: 6, to: 7),
    ]
    testBFS(edges: edges)
}

setup()
