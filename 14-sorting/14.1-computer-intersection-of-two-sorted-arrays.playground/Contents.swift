/**
 A natural implementation for a search engine is to retrieve documents that match the set of words in a query by maintaining an inverted index. An inverted index is a mapping of a word w to a sorted array of page-ids that contain w. The most computationally intensive step of finding results for a query that contains multiple words is the intensive step of finding the intersection of the sorted arrays.
 Write a program which takes as input two sorted arrays, and returns a new array containing elements that are present in both of the input arrays. The input arrays may have duplicate entries, but the returned array should be free of duplicates.
 
 Example: input is <2,3,3,5,5,6,7,7,8,12> and <5,5,6,8,8,9,10,10>. output should be <5,6,8>
 
 Hint: solve the problem if the input array lengths differ by orders of magnitude. What if they are approximately equal?
 */

func intersectTwoSortedArrays(A: [Int], B: [Int]) -> [Int] {
    return intersectTwoSortedArraysInitial(A: A, B: B)
}

/**
 Initial implementation. O(m + n) 
 
 while both arrays "aren't empty"
    compare and iterate array with smaller elements til it catches up with the other array
    when comparing, add equal elements to the result array unless it exists in result already
 */
func intersectTwoSortedArraysInitial(A: [Int], B: [Int]) -> [Int] {
    var result = [Int]()
    var last = Int.min
    var aInd = 0
    var bInd = 0
    while aInd < A.count && bInd < B.count {
        if A[aInd] < B[bInd] {
            aInd += 1
        } else if A[aInd] > B[bInd] {
            bInd += 1
        } else {
            if !(last == A[aInd]) {
                result.append(A[aInd])
                last = A[aInd]
            }
            aInd += 1
            bInd += 1
        }
    }
    return result
}

// Testing
let array1 = [2,3,3,5,5,6,7,7,8,12]
let array2 = [5,5,6,8,8,9,10,10]
let intersection = intersectTwoSortedArrays(A: array1, B: array2)
assert([5, 6, 8] == intersection)
