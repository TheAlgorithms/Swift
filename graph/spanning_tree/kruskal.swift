enum Kruskal {
    struct Vertex {
        let name: String
        let node = UnionFindNode()

        init(_ name: String) {
            self.name = name
        }
    }

    struct Edge {
        let from: Vertex
        let to: Vertex
        let weight: Int
    }

    typealias Graph = [Edge]


    static func kruskal(_ graph: Graph) -> Graph {
        var edges = Heap(graph) { $0.weight < $1.weight }

        var result: Graph = []
        result.reserveCapacity(edges.count)

        while let edge = edges.extractMin() {
            guard !UnionFindNode.inSameSet(edge.from.node, edge.to.node) else {
                continue
            }
            UnionFindNode.union(edge.from.node, edge.to.node)
            result.append(edge)
        }

        return result
    }
}

extension Kruskal.Vertex: CustomStringConvertible {
    var description: String { name }
}

extension Kruskal.Edge: CustomStringConvertible {
    var description: String { "\(from) --(\(weight))-- \(to)" }
}

func testKruskal() {
    typealias Vertex = Kruskal.Vertex
    typealias Edge = Kruskal.Edge

    let A = Vertex("A")
    let B = Vertex("B")
    let C = Vertex("C")
    let D = Vertex("D")
    let E = Vertex("E")
    let F = Vertex("F")
    let G = Vertex("G")

    let graph = [
        Edge(from: A, to: B, weight: 7),
        Edge(from: A, to: D, weight: 5),
        Edge(from: B, to: C, weight: 8),
        Edge(from: B, to: D, weight: 9),
        Edge(from: B, to: E, weight: 7),
        Edge(from: C, to: E, weight: 5),
        Edge(from: D, to: E, weight: 15),
        Edge(from: D, to: F, weight: 6),
        Edge(from: E, to: F, weight: 8),
        Edge(from: E, to: G, weight: 9),
        Edge(from: F, to: G, weight: 11),
    ]

    print(Kruskal.kruskal(graph).map { String(describing: $0) }.joined(separator: "\n") )
}
