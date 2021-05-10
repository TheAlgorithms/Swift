import Foundation

enum ShuntingYard {
    enum Operator: String, CaseIterable {
        case power = "^"
        case plus = "+"
        case minus = "-"
        case times = "*"
        case divide = "/"
    }

    static func evaluate(_ string: String) -> Double {
        let scanner = Scanner(string: string)
        var numberStack: [Double] = []
        var operatorStack: [Operator] = []

        func applyOperator(_ op: Operator) {
            guard let a = numberStack.popLast(), let b = numberStack.popLast() else {
                return
            }

            numberStack.append(op.apply(a, b))
        }

        while !scanner.isAtEnd {
            if let op = scanner.scanOperator() {
                while let last = operatorStack.last, last.precedence > op.precedence || (op.leftAssociative && last.precedence == op.precedence) {
                    applyOperator(last)
                    operatorStack.removeLast()
                }
                operatorStack.append(op)
            } else if let number = scanner.scanDouble() {
                numberStack.append(number)
            } else {
                break
            }
        }

        while let op = operatorStack.popLast() {
            applyOperator(op)
        }

        return numberStack.first ?? 0
    }
}

extension ShuntingYard.Operator {
    var precedence: Int {
        switch self {
        case .power: return 3
        case .divide, .times: return 2
        case .plus, .minus: return 1
        }
    }

    var leftAssociative: Bool {
        switch self {
        case .power: return false
        case .plus, .minus, .times, .divide: return true
        }
    }

    func apply(_ a: Double, _ b: Double) -> Double {
        switch self {
        case .power: return pow(b, a)
        case .divide: return b / a
        case .times: return a * b
        case .plus: return a + b
        case .minus: return b - a
        }
    }
}

private extension Scanner {
    func scanOperator() -> ShuntingYard.Operator? {
        for op in ShuntingYard.Operator.allCases {
            if scanString(op.rawValue) != nil {
                return op
            }
        }
        return nil
    }
}

func testShuntingYard() {
    func test(_ x: String) {
        print(x,"=", ShuntingYard.evaluate(x))
    }

    test("3 + 4 * 5")
    test("4 * 5 + 3")
    test("2 ^ 3 ^ 4")
    test("10.5 - 4 * 5")
    test("2 + 3 ^ 4")
    test("2 * 3 ^ 4")
    test("3 ^ 4")
}
