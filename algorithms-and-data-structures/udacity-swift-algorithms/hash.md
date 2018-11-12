# Simple Hash

### My Implementation
```swift
var arr = [Int](repeating: 0, count: 10)

func hash(value: Int) -> Int {
    return value % 10
}

print(hash(value: 145243))
arr[hash(value: 145342)] = 145243
print(arr[hash(value: 145342)])
arr[hash(value: 10)] = 1010101
print(arr[hash(value: 10)])
```