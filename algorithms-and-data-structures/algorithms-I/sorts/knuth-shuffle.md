```kotlin
fun <T: Comparable<T>> knuthShuffle(arr: Array<T>): Unit {
    for (i in arr.indices) {
        val rand = random(0, i) // uniformly random number between 0, i
        swap(arr, i, rand)
    }
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