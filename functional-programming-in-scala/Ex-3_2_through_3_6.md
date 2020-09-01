```scala
sealed trait List[+A]	
case object Nil extends List[Nothing]	
case class Cons[+A](head: A, tail: List[A]) extends List[A]	


object List {	
  def sum(ints: List[Int]): Int = ints match {	
    case Nil => 0	
    case Cons(x,xs) => x + sum(xs)	
  }


  def product(ds: List[Double]): Double = ds match {
    case Nil => 1.0
    case Cons(0.0, _) => 0.0
    case Cons(x,xs) => x * product(xs)
  }

  def apply[A](as: A*): List[A] =	
    if (as.isEmpty) Nil
    else Cons(as.head, apply(as.tail: _*))
  
  def tail[A](list: List[A]): List[A] = list match {
    case Nil => Nil
    case Cons(_, xs) => xs
  }
  
  def setHead[A](list: List[A], item: A): List[A] = list match {
    case Nil => Cons(item, Nil)
    case Cons(_, xs) => Cons(item, xs)
  }
  
  @annotation.tailrec
  def drop[A](list: List[A], n: Int): List[A] = n match {
    case 0 => list
    case _ => list match {
      case Nil => Nil
      case Cons(_, xs) => drop(xs, n - 1)
    }
  }
  
  @annotation.tailrec
  def dropWhile[A](list: List[A], f: A => Boolean): List[A] = list match {
    case Nil => Nil
    case Cons(x, xs) => if (f(x)) dropWhile(xs, f) else list
  }
}

val l = Cons("hi", Cons("bye", Cons("ok..", Nil)))
println(s"tail of first list ${List.tail(l)}")
println(s"setting head of l results in ${List.setHead(l, "sup")}")
println(s"dropping 2, l is ${List.drop(l, 2)}")
println(s"dropping while length less than 3, l is ${List.dropWhile(l, (s: String) => s.length < 3)}")
```
