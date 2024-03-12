//This algorithm has a function that takes an integer and prints the integer in reverse
import Foundation

func IntegerReversal(number: Int){
    //initialize variables
    var num = number
    var reversed = 0

    //while loop that runs until the entire integer is reversed
    while (num != 0) {
        //adjust reversed integer for place value (for example in 123, 3 becomes the digit in the hundreds place)
        reversed *= 10
        //add digit to the adjusted reversed integer
        reversed += ((num % 10))
        //remove last digit
        num /= 10
    }
    print(reversed)
}

IntegerReversal(number: 12345) //prints 54321
IntegerReversal(number: 90773) //prints 37709
