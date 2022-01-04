import Foundation

// Viết function chuyển số thập phân thành số nhị phân
func changeToBinaryNum(from decimalNumber: Int) -> String {
    var result = ""
    var num = decimalNumber
    while num > 0 {
        switch num % 2 {
        case 0:
            result += "0"
        case 1:
            result += "1"
        default:
            result += "1"
        }
        num /= 2
    }
    return String(result.reversed())
}
changeToBinaryNum(from: 33)

/* Viết chương trình cho phép nhập vào một số nguyên dương n,
 Tính tổng tất cả số chẵn trong khoảng từ 0 - n. */
func sumEvenNumberFromZero(to number: Int) -> String {
    if number < 0 {
        return "Your input must be plus! Try again"
    }
    var result = 0
    for i in 0...number {
        if i % 2 == 0 {
            result += i
        }
    }
    return "Your result is \(result)"
}

print(sumEvenNumberFromZero(to: 5))

/* Viết chương trình để nhập nhập một số nguyên,
 Tìm kết quả phép nhân của số đó với các số từ 1 - 20 , sau đó in kết quả ra màn hình.
 */
func multiplicationFromOneToTwenty(of number: Int) {
    var result = [Int]()
    for i in 1...20 {
        result += [number * i]
    }
    print(result)
}
multiplicationFromOneToTwenty(of: 2)

/* Viết chương trình cho phép nhập vào một số nguyên n ( n < 1000 ),
 In ra tất cả số nguyên tố trong khoảng từ 0 - n.
 */
func findPrimeNumbersFromZero(to number: Int) {
    func isPrime(num: Int) -> Bool {
        switch num {
        case num where num == 2, 3:
            return true
        default:
            let maxDivider = Int(Double(num).squareRoot())
            print(maxDivider)
            return !(2...maxDivider).contains { num % $0 == 0 }
        }
    }
    isPrime(num: 3)
    switch number {
    case number where number > 1000 || number <= 1:
        print("Your input must less than 1000 and greater than 1")
    default:
        var result = [Int]()
        for n in 2...number {
            if isPrime(num: n) {
                result += [n]
            }
        }
        print(result)
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
        switch number {
        case 1:
            result = [1]
        case 2:
            result = [1,1]
        default:
            var n1 = 1
            var n2 = 1
            result += [n1, n2]
            for _ in 3...number {
                let n3 = n1 + n2
                result += [n3]
                n1 = n2
                n2 = n3
            }
        }
        print(result)
    }
}
findFibonacciNumbers(number: 20)
