# Quicksort

### My Implementation
```swift
// return the contents of the input array sorted least to greatest
// create any helper functions you need :)
// want to get fancy? try making input an "inout" parameter, rather than copying it to "result"
// more information here: https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-ID166
func quicksort(_ input: [Int], low: Int, high: Int) -> [Int] {
    // this is a copy of the input so its contents can be modified
    var result = input
    
    // check the base case: low is less than high
    if low > high {
        return result
    }
    
    // select the pivot
    var pivot = high
    
    // perform the partitioning step
    var lo = low
    
    while lo < pivot {
        if result[pivot] < result[lo] {
            let temp = result[lo]
            result[lo] = result[pivot - 1]
            result[pivot - 1] = result[pivot]
            result[pivot] = temp
            pivot -= 1
        } else {
            lo += 1
        }
    }
    
    // make the recursive call with the new high and low values
    let lower = quicksort(result, low: low, high: pivot - 1)
    return quicksort(lower, low: pivot + 1, high: high)
}

// Test case
var testArray = [21, 4, 1, 3, 9, 20, 25, 6, 21, 14]
print(quicksort(testArray, low: 0, high: testArray.count - 1))
```


### Udacity Implementation
```swift

import Foundation

func quicksort(_ input: [Int], low: Int, high: Int) -> [Int] {
    var result = input

    if low < high {
        let pivot = result[high]
        var i = low

        for j in low..<high {
            if result[j] <= pivot {
                (result[i], result[j]) = (result[j], result[i])
                i += 1
            }
        }
        (result[i], result[high]) = (result[high], result[i])
        result = quicksort(result, low: low, high: i - 1)
        result = quicksort(result, low: i + 1, high: high)
    }

    return result
}
```