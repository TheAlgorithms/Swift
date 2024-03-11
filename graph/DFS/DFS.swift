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

// MARK: - DFS Recursion
func dfs(vertex: Int, visited: inout [Bool], graph: [Int: Node]) {
    if visited[vertex] == true {
        return
    }
    visited[vertex] = true
    print("\(vertex) ")
    guard let neighbors = graph[vertex] else { return }
    for neighbor in neighbors.neighbors {
        dfs(vertex: neighbor, visited: &visited, graph: graph)
    }
}

func testDFS(edges: [Edge]) {
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
    for node in 1...graph.count {
        if visited[node] == false {
            dfs(vertex: node, visited: &visited, graph: graph)
        }
    }
}


// MARK: - setup
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
    testDFS(edges: edges)
}
