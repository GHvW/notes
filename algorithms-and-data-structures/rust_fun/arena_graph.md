```rust
struct Node<T> {
  val: T,
  edges: Vec<Edge>
}

struct Edge<T> {
  val: T,
  to: Node<T>,
  from: Node<T>,
}
```
