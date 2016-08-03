/*
 * Creative Coding
 * Week 2, Foldout 02: Conditionals: if statement
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 
 * This program illustrates the use of the if statement.
 * The general form is:
 * if (condition) {
 *   execute the code in here
 *   if the condition is true
 * } else {
 *   execute the code
 *   in here
 * }
 *
 * The else { ... } component is optional.
 * 
 */   

void setup() {
  size(500, 300);
}

void draw() {
  background(0);
  
  stroke(255); 
  
  for (int i = 0; i < width; i += 4) {
    if (i%3 == 0) {
      // this section of code is executed if the remainder of
      // dividing i by 3 equals 0
      line(i, 0, i, 100);
    }
    else if (i%3 == 1) {
      // this section is executed if i%3 == 1
      line(i, 100, i, 200);
    }
    else if (i%3 == 2) {
      // thes section if i%3 == 2
      // you can have as many lines of code as you like
      // between the opening and closing { }
      // You can even have other if statements!
      line(i, 200, i, 300);
    } // end if
  } // end for
  
} // end draw