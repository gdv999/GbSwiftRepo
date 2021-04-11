import UIKit

// Задание 1

func numberIsOdd(userNumber: Int) -> Bool {
    
    return userNumber % 2 != 0
}

numberIsOdd(userNumber: 4)
numberIsOdd(userNumber: 5)

// Задание 2

func numberHasRemainder(userNumber: Int) -> Bool {
    
    return userNumber % 3 != 0
}

numberHasRemainder(userNumber: 4)
numberHasRemainder(userNumber: 15)

// Задание 3

var myArray = [Int](1...100)

// Задание 4

myArray.removeAll(where: {$0 % 2 == 0 || $0 % 3 != 0})

print(myArray)

// Задание 5

var myFibonacciArray = [1,1]

func calcFibonacciNumber() {
    var i = 1
    repeat {
        let lastTwo = myFibonacciArray.suffix(2)
        let sumOfLastTwo = lastTwo.reduce(0, +)
        
        myFibonacciArray.append(sumOfLastTwo)
        i += 1
    } while i <= 50
}

calcFibonacciNumber()
print(myFibonacciArray)

    
// Задание 6 – не получилось решить



