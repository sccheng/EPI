// Design a stack that includes a max operation, in addition to push and pop. The max method should return the maximum value stored in the stack.
// Hint: Use additional storage to track the maximum value.

struct maxWithCount {
    var value: Int
    var count: Int
}

struct stackWithMax {
    var stack = [Int]()
    var currentMax = [maxWithCount]()
    
    mutating func push(newInt: Int) {
        stack.append(newInt)
        if let lastMax = currentMax.last {
            if newInt > lastMax.value {
                currentMax.append(maxWithCount(value: newInt, count: 1))
            } else if newInt == lastMax.value {
                currentMax[currentMax.count - 1] = maxWithCount(value: newInt, count: lastMax.count + 1)
            }
        }
    }
    
    mutating func pop() -> Int {
        let last = stack.removeLast()
        if let lastMax = currentMax.last {
            if last == lastMax.value {
                if lastMax.count > 1 {
                    currentMax[currentMax.count - 1] = maxWithCount(value: lastMax.value, count: lastMax.count - 1)
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
