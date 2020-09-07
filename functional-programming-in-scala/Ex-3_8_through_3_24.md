```scala
sealed trait List[+A]
case object Nil extends List[Nothing]	
case class Cons[+A](head: A, tail: List[A]) extends List[A]	


object List {
  def tail[A](list: List[A]): List[A] = list match {
    case Nil => Nil
    case Cons(_, xs) => xs
  }

  def apply[A](as: A*): List[A] =
    if (as.isEmpty) Nil
    else Cons(as.head, apply(as.tail: _*))

  def foldRight[A, B](as: List[A], z: B)(f: (A, B) => B): B = as match {
    case Nil => z
    case Cons(x, xs) => f(x, foldRight(xs, z)(f))
  } 

  def length[A](as: List[A]): Int = {
    foldRight(as, 0) { (item, total) => total + 1 }
  }
  
  def foldLeft[A, B](as: List[A], z: B)(f: (B, A) => B): B = as match {
    case Nil => z
    case Cons(x, xs) => foldLeft(xs, f(z, x))(f)
  }
  
  def lengthLeft[A](as: List[A]): Int = {
    foldLeft(as, 0) { (total, item) => total + 1 }
  }
  
  def sumLeft(l: List[Int]): Int = {
    foldLeft(l, 0) { (item, total) => total + item }
  }
  
  def productLeft(l: List[Int]): Int = {
    foldLeft(l, 1) { (item, total) => total * item }
  }
  
  // def rightViaLeft[A, B](as: List[A], z: B)(f: (B, A) => B): B
}

List.foldRight(List(1,2,3), Nil:List[Int])(Cons(_,_))
List.length(List(1,2,3))
List.lengthLeft(List(1, 2, 3))
List.sumLeft(List(1,2,3))
List.productLeft(List(1,2,3,4))
```