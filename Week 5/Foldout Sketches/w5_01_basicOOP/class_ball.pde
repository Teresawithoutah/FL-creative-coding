//
// declaration of the class "Ball"
// Which represents the concept of a ball with a position and size
//
class Ball {

  // instance variables: x,y (position) and size
  float x;
  float y;
  float size;

  // constructor: called when a new Ball is created
  // Note that the constructor is a special function that
  // does have a return type (not even a void) and can't
  // return any value
  Ball(float x_, float y_, float size_) {
    // store supplied values in the instance variables
    x = x_;
    y = y_;
    size = size_;
  }

  // display method
  // 
  void display() {
    ellipse(x, y, size, size);
  }
}

