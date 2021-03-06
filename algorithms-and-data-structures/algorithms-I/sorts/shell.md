

Knuth's 3x+1 implementation
used in hardware/embedded systems because relatively fast and is memory efficient


```kotlin
fun <T: Comparable<T>> shellSort(arr: Array<T>): Unit {
    val count = arr.size - 1
    
    var h = 1
    while (h < (count / 3)) { // divide by 3 so don't go out of bounds on 3x + 1
    	h = 3*h + 1 //1, 4, 13, 40, 121, 364
    }
    
    while (h >= 1) {
        for (i in h..count) { // insertion sort
            var current = i
            while (current >= h && lessThan(arr[current], arr[current - h])) {
                swap(arr, current, current - h)
                current -= h
            }
        } // end insertion sort
        h = h / 3
    }
    return Unit
}
```