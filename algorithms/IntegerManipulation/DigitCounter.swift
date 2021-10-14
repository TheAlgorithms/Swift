//This algorithm has a function that takes an integer and prints the number of times a certain digit is in the integer
import Foundation

func DigitCounter(number: Int, searchDigit: Int){
    //initialize variables
    var num = number
    var count = 0

    //create while loop that runs until the entire intger is tested
    while (num != 0) {
        //see if the last digit is the seach term
        if num % 10 == searchDigit {
            //increment count
            count += 1
        }
        //remove last digit
        num /= 10
    }
    print("\(searchDigit) is in the integer \(count) times")
}

DigitCounter(number: 12345, searchDigit: 5) //5 is in the integer 1 times
DigitCounter(number: 90773, searchDigit: 7) //7 is in the integer 2 times
DigitCounter(number: 77777, searchDigit: 6) //6 is in the integer 0 times
