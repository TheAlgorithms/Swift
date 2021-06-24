    import XCTest
    @testable import Algorithms
    
    final class GraphTests: XCTestCase {
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
            
            let exp = "A --(5)-- D\nC --(5)-- E\nD --(6)-- F\nA --(7)-- B\nB --(7)-- E\nE --(9)-- G"
            XCTAssertEqual(exp, Kruskal.kruskal(graph).map { String(describing: $0) }.joined(separator: "\n"))
        }
    }
