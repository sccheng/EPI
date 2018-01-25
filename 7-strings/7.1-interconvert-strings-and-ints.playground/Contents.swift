// Implement methods that take a string representing an integer and return the corresponding integer, and vice versa. The code should handle negative integers. Library functions aren't allowed
// Hint: Build the result one digit at a time.

func intToString(_ i: Int) -> String {
    var isNegative = i < 0
    var numCopy = isNegative ? -i : i
    var result = ""
    while numCopy > 0 {
        result.append(String(numCopy % 10))
        numCopy /= 10
    }
    if isNegative {
        result.append("-")
    }
    result = String(result.reversed())
    return result
}

func stringToInt(_ s: String) -> Int {
    var result = 0
    var isNegative = false
    for char in s {
        if char == "-" {
            isNegative = true
            continue
        }
        result = result * 10 + Int(String(char))!
    }
    return isNegative ? -result : result
}

// Testing
let posIntToString = intToString(123)
assert("123" == posIntToString, "\"123\" != \(posIntToString)")
let posStringToInt = stringToInt("123")
assert(123 == posStringToInt, "123 != \(posStringToInt)")
let negIntToString = intToString(-123)
assert("-123" == negIntToString, "\"-123\" != \(negIntToString)")
let negStringToInt = stringToInt("-123")
assert(-123 == negStringToInt, "-123 != \(negStringToInt)")
