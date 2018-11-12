# Binary Search


### My Implementation
```swift
// Return the index in the array, of the desired value
// If the value can't be found, return nil
func binarySearch(_ array: [Int], value: Int) -> Int? {
    var lo = 0
    var hi = array.count
    
    while hi >= lo {
        let mid = lo + ((hi - lo) / 2)
        if value > array[mid] {
            lo = mid + 1
        } else if value < array[mid] {
            hi = mid - 1
        } else {
            return mid
        }
    }
    return nil
}

// Test cases
let testArray = [1, 3, 9, 11, 15, 19, 29]
let testVal1 = 25
let testVal2 = 15
print(binarySearch(testArray, value: testVal1)) // Should be nil
print(binarySearch(testArray, value: testVal2)!) // Should be 4
```