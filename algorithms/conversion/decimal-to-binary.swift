/// This function accepts a non-negative number and returns its binary form as String.
public func convertDecimalToBinary(decimal: Int) -> String {
    var binary = ""
    var decimal = decimal

    while decimal != 0 {
        binary.insert(decimal % 2 == 0 ? "0" : "1", at: binary.startIndex)
        decimal /= 2
    }

    return binary
}