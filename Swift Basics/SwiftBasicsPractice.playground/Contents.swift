import Foundation

// Viết function chuyển số thập phân thành số nhị phân
func changeToBinaryNum(from decimalNumber: Int) {
    var result = [String]()
    var num = decimalNumber
    if num <= 0 {
        print("Your input must be greater than 0! Try again")
    } else {
        while num > 0 {
            result += [num].map {$0 % 2 == 0 ? "0" : "1"}
            num /= 2
        }
        print(result.reversed().joined())
    }
}
changeToBinaryNum(from: 33)

/* Viết chương trình cho phép nhập vào một số nguyên dương n,
 Tính tổng tất cả số chẵn trong khoảng từ 0 - n. */
func sumEvenNumberFromZero(to number: Int) {
    if number <= 0 {
        print("Your input must be greater than 0! Try again")
    } else {
        let result = (0...number)
            .filter { $0 % 2 == 0 }
            .reduce(0, +)
        print("Your result is \(result)")
    }
}
sumEvenNumberFromZero(to: 5)

/* Viết chương trình để nhập nhập một số nguyên,
 Tìm kết quả phép nhân của số đó với các số từ 1 - 20 , sau đó in kết quả ra màn hình.
 */
func multiplicationFromOneToTwenty(of number: Int) {
    let result = (1...20).map { $0 * number }
    print(result)
}
multiplicationFromOneToTwenty(of: 2)

/* Viết chương trình cho phép nhập vào một số nguyên n ( n < 1000 ),
 In ra tất cả số nguyên tố trong khoảng từ 0 - n.
 */
func findPrimeNumbersFromZero(to number: Int) {
    func isPrime(num: Int) -> Bool {
        let maxDivider = Int(Double(num).squareRoot())
        return num == 2 || num == 3 ? true :
        !(2...maxDivider).contains { num % $0 == 0 }
    }
    
    if number > 1000 || number <= 1 {
        print("Your input must less than 1000 and greater than 1")
    } else {
        print((2...number).filter { isPrime(num: $0) == true })
    }
}
findPrimeNumbersFromZero(to: 5)

/*Viết chương trình cho phép nhập vào số nguyên n( n <= 20 )
 In ra số Fibonacci ứng với nó.
 */
func findFibonacciNumbers(number: Int) {
    if number <= 0 || number > 20 {
        print("Number must greater than 0 and less than 20")
    } else {
        var result = [Int]()
        if number == 1 || number == 2 {
            (1...number).forEach { _ in result += [1] }
        } else {
            result = [1, 1]
            (0...number - 3).forEach { num in
                result.append(result[num] + result[num + 1])
            }
        }
        print(result)
    }
}
findFibonacciNumbers(number: 20)
