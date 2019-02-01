increment until current val is less than the last value
swap until it is no longer less than the next val
instructor implemented with nexted loop that counts down to 0 from i
breaking if arr[current] is greater than arr[current - 1]
insertion is best case n - 1 compares
slower than selection sort if list is perfectly unsorted
because it not only compares, but exchanges each time as well
```kotlin
fun <T: Comparable<T>> insertionSort(arr: Array<T>): Unit {
    val count = arr.size - 1
    for (i in 0..count) {
        var current = i
        while (current > 0 && lessThan(arr[current], arr[current - 1])) {
            swap(arr, current, current - 1)
            current -= 1
        }
    }
    return Unit
}

fun <T: Comparable<T>> swap(arr: Array<T>, first: Int, second: Int): Unit {
    val temp = arr[first]
    arr[first] = arr[second]
    arr[second] = temp
    return Unit
}

fun <T: Comparable<T>> lessThan(first: T, second: T): Boolean {
    return first.compareTo(second) < 0
}
```