// Design a stack that includes a max operation, in addition to push and pop. The max method should return the maximum value stored in the stack.
// Hint: Use additional storage to track the maximum value.

struct MaxWithCount: CustomStringConvertible {
    var value: Int
    var count: Int
    var description: String {
        return "(max: \(value), count: \(count))"
    }
}

// For additional space to track max: Worst case O(n) if each added value is a max; best case O(1)
// Push and pop are O(1) time (append, removeLast), max is O(1)
struct StackWithMax {
    var stack = [Int]()
    var currentMax = [MaxWithCount]()
    
    mutating func push(newInt: Int) {
        stack.append(newInt)
        if currentMax.isEmpty {
            currentMax.append(MaxWithCount(value: newInt, count: 1))
        } else if let lastMax = currentMax.last {
            if newInt > lastMax.value {
                currentMax.append(MaxWithCount(value: newInt, count: 1))
            } else if newInt == lastMax.value {
                currentMax[currentMax.count - 1] = MaxWithCount(value: newInt, count: lastMax.count + 1)
            }
        }
    }
    
    mutating func pop() -> Int {
        let last = stack.removeLast()
        if let lastMax = currentMax.last {
            if last == lastMax.value {
                if lastMax.count > 1 {
                    currentMax[currentMax.count - 1] = MaxWithCount(value: lastMax.value, count: lastMax.count - 1)
                } else if lastMax.count == 1 {
                    currentMax.removeLast()
                }
            }
        }
        return last
    }
    
    func max() -> Int? {
        return currentMax.last?.value
    }
}

// Testing
var stackTesting = StackWithMax()
stackTesting.push(newInt: 2)
printStack(stackTesting)
stackTesting.push(newInt: 2)
printStack(stackTesting)
stackTesting.push(newInt: 1)
printStack(stackTesting)
stackTesting.push(newInt: 4)
printStack(stackTesting)
stackTesting.pop()
printStack(stackTesting)
stackTesting.pop()
printStack(stackTesting)
stackTesting.pop()
printStack(stackTesting)
stackTesting.pop()
printStack(stackTesting)
stackTesting.push(newInt: 3)
printStack(stackTesting)
stackTesting.pop()
printStack(stackTesting)

// printStack
func printStack(_ stack: StackWithMax) {
    print(stack)
}

