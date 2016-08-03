/*
 * Creative Coding
 * Week 1, 03 - Draw your name! (part 3)
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image.
 * Press 'r' to erase all your drawing and start with a blank screen
 * 
 */

// variables to store the delay and target counts
int delayCount;
int targetCount;

// variable to represent the brush style
int style; 

// setup function
void setup() {
  size(500, 500);
  background(255);

  delayCount = 0;
  targetCount = (int) random(5, 50); // set target count to a random integer between 5 and 50
}

// draw function
void draw() {

  /* draw a rectangle on your mouse point while you pressing 
   the left mouse button*/

  delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(4);
    targetCount = (int) random(5, 20) ;
    delayCount = 0;
  }
  else {
    style = 0;
  }

  if (mousePressed) {

    stroke(0); 
    fill(0);

    // switch statement
    switch(style) {
    case 0:
      // draw a point
      point(mouseX, mouseY);
      break;

    case 1:
      // draw a circle with random radius
      float eSize = random(1, 20);
      ellipse(mouseX, mouseY, eSize, eSize);
      break;

    case 2:
      // draw a rectangle with random size
      float qSize = random(1, 10);
      quad(mouseX-qSize, mouseY, mouseX, mouseY-qSize, mouseX+qSize, mouseY, mouseX, mouseY+qSize   );
      break;

    case 3:
      // draw a triangle with random size
      float tSize = random(1, 5);
      triangle(mouseX-tSize, mouseY+tSize, mouseX, mouseY-tSize, mouseX+tSize, mouseY+tSize); 
      break;
    } // end of switch statement
  }

  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourName.jpg");
  }

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(255);
  }
}