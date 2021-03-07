// The Fibonacci numbers, commonly denoted F(n) form a sequence,
// called the Fibonacci sequence, such that # each number is the sum
// of the two preceding ones, starting from 0 and 1. That is,
//
// F(0) = 0, F(1) = 1
// F(n) = F(n - 1) + F(n - 2), for n > 1
//
// Given n, calculate F(n).
//
// @leticiafaleia

func fibonacci(_ number: Int) -> Int {
    guard number > 1 else { return number }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

fibonacci(5)
