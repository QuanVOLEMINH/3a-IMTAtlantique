

class Stack (list: List[Int]){  
  
  def push(e: Int): List[Int] = {
    var newList: List[Int] = list;
    return newList :+ e;
  }
  
  def pop(): List[Int] = {
    var newList: List[Int] = list;
    return newList.slice(1, newList.length + 1);
  }
}
