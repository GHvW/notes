
find smallest entry in array and swap with value at index
always has to do the same amount of iterations no matter what
```kotlin
fun <T: Comparable<T>> selectionSort(arr: Array<T>): Unit {
    val count = arr.size - 1
    
    for (i in 0..count) {
        var min = i
        for (j in (i + 1)..count) {
            if (lessThan(arr[j], arr[min])) {
                min = j
            }
        }
        swap(arr, i, min)
    }
    return Unit
}

fun <T: Comparable<T>> swap(arr: Array<T>, i: Int, min: Int): Unit {
    val temp = arr[i]
    arr[i] = arr[min]
    arr[min] = temp
    return Unit
}

fun <T: Comparable<T>> lessThan(first: T, second: T): Boolean {
    return first.compareTo(second) < 0
}
```kotlin