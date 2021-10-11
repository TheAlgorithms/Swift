// Find a given Fibonacci number
// The number comes from the so-called Fibonacci sequence,
// which is defined by each number being equal to the sum of the two previous ones
//
// This dynamic programming solution stores previous values in the f array
// this allows the function to run very fast because it doesn't need to recalculate all values.

func fibonacci(_ number: Int) -> Int {
    var f = [0, 1]
    for i in 2 ... number + 1 {
        f.append(f[i - 1] + f[i - 2])
    }
    return f[number]
}

assert(fibonacci(8) == 21)
assert(fibonacci(50) == 12_586_269_025)
