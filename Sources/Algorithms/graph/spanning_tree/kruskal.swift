import DataStructures
public enum Kruskal {
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
