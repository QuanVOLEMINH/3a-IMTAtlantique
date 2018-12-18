import scala.actors.Actor
import scala.actors.Actor._

object TestActors {
  val fussyActor = actor {
    loop {
      react {
        case s: String => println("I receive a String: " + s)
        case i: Int => println("I receive an Int: " + i.toString)
        case _ => println("Unknown")
      }
    }
  }

  def main(args: Array[String]): Unit = {
    fussyActor ! "hello"; fussyActor ! -5; fussyActor ! 'a'
  }
}

case class Inc(amount: Int)
case object Value

class Counter extends Actor {
  var counter: Int = 0;

  def act() = {
    while (true) {
      receive {
        case Inc(amount) => counter += amount
        case Value => println("Value is " + counter); exit()
      }
    }
  }
}

object ActorTest extends App {
  val counter = new Counter
  counter.start()

  for (i <- 0 until 100000) counter ! Inc(1)
  counter ! Value // prints: Value is 100000
}
