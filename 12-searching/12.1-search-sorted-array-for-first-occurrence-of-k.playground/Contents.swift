/**
 Write a method that takes a sorted array and a key and returns the index of the first occurrence of that key in the array.
 
 Ex: [-14, -10, 2, 108, 108, 243, 285, 285, 285, 401] should return 3 if given key is 108, 6 if the given key is 285.
 */

func searchFirstOfK(array: [Int], k: Int) -> Int {
//    return searchFirstOfKNaive(array: array, k: k, start: 0, end: array.count - 1)
    return searchFirstOfKOptimized(array: array, k: k)
}

// Naive approach. Search is O(log(n)), but iterating to first is O(n) worst case.
func searchFirstOfKNaive(array: [Int], k: Int, start: Int, end: Int) -> Int {
    guard start < end else {
        return -1
    }
    
    var mid = (start + end) / 2
    if k < array[mid] {
        return searchFirstOfKNaive(array: array, k: k, start: start, end: mid - 1)
    } else if k > array[mid] {
        return searchFirstOfKNaive(array: array, k: k, start: mid + 1, end: end)
    } else {
        while mid >= start, k == array[mid] {
            mid -= 1
        }
        return mid + 1
    }
}

// Optimized approach. Continue binary search until first of k is found.
// This solution should be O(log(n)), unlike the earlier naive approach, which is O(n).
func searchFirstOfKOptimized(array: [Int], k: Int) -> Int {
    var start = 0
    var end = array.count - 1
    var result = -1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if k < array[mid] {
            end = mid - 1
        } else if k > array[mid] {
            start = mid + 1
        } else {
            result = mid
            end = mid - 1
        }
    }
    
    return result
}

// Testing
let array = [-14, -10, 2, 108, 108, 243, 285, 285, 285, 401]
let searchFor108 = searchFirstOfK(array: array, k: 108)
assert(3 == searchFor108)
let searchFor285 = searchFirstOfK(array: array, k: 285)
assert(6 == searchFor285)
