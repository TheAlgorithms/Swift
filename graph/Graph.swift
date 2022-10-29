struct GraphEdge<G: Graph> {
    var from: G.Node
    var to: G.Node
    var value: G.EdgeValue
}

protocol Graph {
    typealias Edge = GraphEdge<Self>

    associatedtype Node: Equatable
    associatedtype EdgeValue

    func edges(from: Node) -> [Edge]
}

struct AdjacencyList<Node: Hashable, EdgeValue>: Graph {
    typealias EdgeValue = EdgeValue
    typealias Node = Node

    var graph: [Node: [Edge]] = [:]

    func edges(from node: Node) -> [Edge] {
        graph[node, default: []]
    }

    mutating func insert(from: Node, to: Node, value: EdgeValue) {
        graph[from, default: []].append(Edge(from: from, to: to, value: value))
    }

    var allEdges: [Edge] {
        graph.values.flatMap { $0 }
    }
}

extension AdjacencyList where EdgeValue == () {
    mutating func insert(from: Node, to: Node) {
        insert(from: from, to: to, value: ())
    }
}

extension Graph {
    func depthFirstSearch(start: Node, destination: Node) -> [Edge]? {
        if start == destination {
            return []
        }

        for edge in edges(from: start) {
            if let path = depthFirstSearch(start: edge.to, destination: destination) {
                return [edge] + path
            }
        }

        return nil
    }
}

extension Graph where Node: Hashable {
    func breadthFirstSearch(start: Node, destination: Node) -> [Edge]? {
        var queue: [(Node, [Edge])] = [(start, [])]
        var visited: Set<Node> = [start]

        while !queue.isEmpty {
            let (current, path) = queue.removeFirst()
            if current == destination {
                return path
            }

            for edge in edges(from: current) where visited.insert(edge.to).inserted {
                queue.append((edge.to, path + [edge]))
            }
        }

        return nil
    }
}

extension GraphEdge: CustomDebugStringConvertible {
    var debugDescription: String {
        if type(of: value) == Void.self {
            return "\(from) -- \(to)"
        } else {
            return "\(from) -\(value)- \(to)"
        }
    }
}

var graph = AdjacencyList<String, Void>()
graph.insert(from: "a", to: "b")
graph.insert(from: "a", to: "d")
graph.insert(from: "b", to: "c")
graph.insert(from: "c", to: "d")

func test<G: Graph>(_ message: String, _ list: [GraphEdge<G>]?) {
    print(message)
    if let list = list {
        for edge in list {
            print(edge)
        }
    } else {
        print("Not found")
    }
    print("")
}

test("Depth-first a -> d", graph.depthFirstSearch(start: "a", destination: "d"))
test("Depth-first a -> e", graph.depthFirstSearch(start: "a", destination: "e"))

test("Breadth-first a -> d", graph.breadthFirstSearch(start: "a", destination: "d"))
test("Breadth-first a -> e", graph.breadthFirstSearch(start: "a", destination: "e"))
