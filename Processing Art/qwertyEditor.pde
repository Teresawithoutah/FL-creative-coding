/*
 * qwertyEditor
 * Week 1, 01 - Draw your name!
 * Creative Coding by Indae Hwang and Jon McCormack modified by Andrey Agafonov
 * Updated 2016
 * Creative Coding Copyright (c) 2014-2016 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'backspace' to erase your drawing and start with a blank screen
 * 
 */

// variables to store the delay and target counts
int delayCount;
int targetCount;

// variable to represent the brush style
int style; 
// setup function -- called once when the program begins

void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(255);
  
  delayCount = 0;
  targetCount = (int) random(5, 50); // set target count to a random integer between 5 and 50
  
  // set the rectangle mode to draw from the centre with a specified radius
  // rectMode(RADIUS);
}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a shape at your mouse point while you are pressing 
   the left mouse button and one of the QWERTY buttons (at the same time).
   Q + LM = big blue transparent rectangles
   W + LM = small colorful ellipses
   E + LM = small black rectangles
   R + LM = red lines
   T + LM = colorful triangles
   Y + LM = white background eraser
   U + LM = dark background eraser
   RM = random colorful shapes
   s = save
   d = reset to dark background
   l = reset to light background */

delayCount++; // increment delay count (shorthand for delayCount = delayCount + 1)

  if (delayCount == targetCount) {
    style = (int) random(3);
    targetCount = (int) random(5, 20) ;
    delayCount = 0;
  }
  else {
    style = 0;
  }

// draw random colorful shapes with right mouse button pressed
  if (mousePressed && (mouseButton == RIGHT)) {

    stroke(10);
    fill(random(100,255),random(150,255),random(200,255));

    // switch statement
    switch(style) {

    case 0:
      // draw a circle with random radius
      float eSize = random(30, 40);
      ellipse(mouseX, mouseY, eSize, eSize);
      break;

    case 1:
      // draw a rectangle with random size
      float qSize = random(30, 40);
      quad(mouseX-qSize, mouseY, mouseX, mouseY-qSize, mouseX+qSize, mouseY, mouseX, mouseY+qSize   );
      break;

    case 2:
      // draw a triangle with random size
      float tSize = random(25, 30);
      triangle(mouseX-tSize, mouseY+tSize, mouseX, mouseY-tSize, mouseX+tSize, mouseY+tSize); 
      break;
    }
  }


  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='q') {
    stroke(random(255),random(255),random(255),random(255));
    fill(10,60,240,15); 
    rect(mouseX, mouseY, random(40,75), random(40,75));
  }
  
  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='w') {
    stroke(random(255),random(255),random(255));
    fill(random(255),random(255),random(255)); 
    ellipse(mouseX, mouseY, random(10,20), random(10,20));
  }
  
  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='e') {
    stroke(255);
    fill(0); 
    rect(mouseX+random(10), mouseY+random(7), random(15), random(15));
  }
  
  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='r') {
    stroke(random(255),random(5),random(5));
    fill(random(255),random(5),random(5)); 
    line(mouseX, mouseY, random(500), random(500));
  }
  
  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='t') {
    stroke(random(100),random(80),random(90)); 
    fill(random(100,255),random(150,255),random(200,255)); 
    triangle(mouseX+random(20,40), mouseY+random(20,40), mouseX-random(20,40), mouseY-random(20,40), mouseY+random(20,40),mouseX+random(20,40));
  }
  
  // white background eraser
  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='y') {
    stroke(255); 
    fill(255); 
    rect(mouseX, mouseY, 20, 20);
  }
  
  // dark background eraser
  if (mousePressed && (mouseButton == LEFT) && keyPressed == true && key=='u') {
    stroke(10); 
    fill(10); 
    rect(mouseX, mouseY, 20, 20);
  }
  
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("yourArtwork"+frameCount+".jpg");
  }

  // switch to dark background when you press keyboard 'd'
  if (keyPressed == true && key == 'd') {
  background(10);
  }
  
  // switch to light background when you press keyboard 'l'
  if (keyPressed == true && key == 'l') {
  background(255);
  }
}