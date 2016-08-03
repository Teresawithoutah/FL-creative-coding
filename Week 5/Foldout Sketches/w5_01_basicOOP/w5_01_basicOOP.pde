/*
 * Creative Coding
 * Week 5, 01 - Basic Object-Oriented Programming, Classes and Objects
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This sketch shows the basics of classes and objects in Processing
 * It defines a class called "Ball" with one member function: "display()"
 *
 */

// declare two objects of class Ball 
Ball bigBall;
Ball smallBall;

void setup(){
  size(300, 300);
  
  // allocate space for each ball and call the class constructor
  // to initialise the object using the values supplied
  bigBall = new Ball(75, 75, 50);
  smallBall = new Ball(225, 225, 20);
}

void draw(){
  background(0);
  
  // call each ball's display() method 
  // this tells the ball: "display yourself"
  bigBall.display();
  smallBall.display();
}  