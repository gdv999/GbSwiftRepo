import UIKit

// Задание 3

var deposit = 100000
var interest = 3
var year = 0

repeat {
    deposit = deposit + deposit * interest / 100
    year+=1
} while year < 5

print(deposit)

// Задание 1

let a = 5.0
let b = 17.0
let c = 1.0

let d = (b * b) - (4 * a * c)

if d < 0.0 {
    print("Discriminant has no roots")

    }   else if d == 0.0 {
    let x = (-b + sqrt(d)) / (2 * a)
    print(x)

}   else {
    let x1 = (-b + sqrt(d)) / (2 * a)
    let x2 = (-b - sqrt(d)) / (2 * a)
    
    print(x1, x2)
    
}

// Задание 2

let aSide = 7.0
let bSide = 21.0

let hipotenuse = sqrt((aSide * aSide) + (bSide * bSide))

let square = (aSide * bSide) / 2

let perimeter = aSide + bSide + hipotenuse

print("Hipotenuse = \(hipotenuse) , Square = \(square) , Perimeter = \(perimeter)")

