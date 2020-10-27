// A simple code about Fibonacci recursive form 
// @leticiafaleia

func fibonacci(_ number: Int) -> Int {
    guard number > 1 else { return number }
    return fibonacci(number - 1) + fibonacci(number - 2)
}

fibonacci(5)
