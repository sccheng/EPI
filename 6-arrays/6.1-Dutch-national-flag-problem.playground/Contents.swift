// Write a program that takes an array A and an index i into A, and rearranges elements such that all elements less than A[i] (the "pivot) appear first, followed by elements equal to the pivot, followed by elements greater than the pivot.

// 'Three lists' method results in O(n) additional space and O(n) time
func dutchFlagPartitionThreeLists(pivotIndex: Int, A: inout [Int]) {
    var lessThan = [Int]()
    var equalTo = [Int]()
    var greaterThan = [Int]()
    
    let pivotValue = A[pivotIndex]
    
    for element in A {
        if element < pivotValue {
            lessThan.append(element)
        } else if element == pivotValue {
            equalTo.append(element)
        } else {
            greaterThan.append(element)
        }
    }
    
    A = lessThan + equalTo + greaterThan
}

// 'Two passes' method results in O(1) space but O(n^2) time
func dutchFlagPartitionTwoPasses(pivotIndex: Int, A: inout [Int]) {
    let pivotValue = A[pivotIndex]
    
    for (index, _) in A.enumerated() {
        for (index2, element2) in A.enumerated() {
            if index > index2 {
                continue
            }
            if element2 < pivotValue {
                A.swapAt(index, index2)
                break
            }
        }
    }
    
    for (index, _) in A.enumerated().reversed() {
        for (index2, element2) in A.enumerated().reversed() {
            if index < index2 {
                continue
            }
            if element2 > pivotValue {
                A.swapAt(index, index2)
                break
            } else if element2 < pivotValue {
                break
            }
        }
    }
}

// This improved 'Two Passes' method results in O(1) space and O(n) time
func dutchFlagPartitionTwoPassesImproved(pivotIndex: Int, A: inout [Int]) {
    let pivotValue = A[pivotIndex]
    
    var smallerIndex = 0
    for (index, element) in A.enumerated() {
        if element < pivotValue {
            A.swapAt(smallerIndex, index)
            smallerIndex += 1
        }
    }
    
    var largerIndex = A.count - 1
    for (index, element) in A.enumerated().reversed() {
        if element > pivotValue {
            A.swapAt(largerIndex, index)
            largerIndex -= 1
        }
    }
}

// Testing
var threeListsResult = [0, 1, 2, 0, 2, 1, 1]
dutchFlagPartitionThreeLists(pivotIndex: 3, A: &threeListsResult)
var threeListsResult2 = [0, 1, 2, 0, 2, 1, 1]
dutchFlagPartitionThreeLists(pivotIndex: 2, A: &threeListsResult2)

var twoPassesResult = [0, 1, 2, 0, 2, 1, 1]
dutchFlagPartitionTwoPasses(pivotIndex: 3, A: &twoPassesResult)
var twoPassesResult2 = [0, 1, 2, 0, 2, 1, 1]
dutchFlagPartitionTwoPasses(pivotIndex: 2, A: &twoPassesResult2)

var improvedTwoPassesResult = [0, 1, 2, 0, 2, 1, 1]
dutchFlagPartitionTwoPassesImproved(pivotIndex: 3, A: &improvedTwoPassesResult)
var improvedTwoPassesResult2 = [0, 1, 2, 0, 2, 1, 1]
dutchFlagPartitionTwoPassesImproved(pivotIndex: 2, A: &improvedTwoPassesResult2)
