/*
 * Creative Coding
 * Week 1, 01 - Draw your name!
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 
 * This program allows you to draw using the mouse.
 * Press 's' to save your drawing as an image to the file "yourName.jpg"
 * Press 'r' to erase your drawing and start with a blank screen
 * 
 */


// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(0);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);
}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    // draw a rectangle with a small random variation in size
    stroke(0); // set the stroke colour to a white
    fill(102,108,239,150); // set the fill colour to white with transparency
    rect(mouseX, mouseY, random(6), random(6));
  }
  if (mousePressed && keyPressed == true && key=='m'){
   stroke(0); // set the stroke colour to a white
    fill(00,255, 0,150); // set the fill colour to lime with transparency
    rect(mouseX, mouseY, random(6), random(6));
  } 
  
   if (mousePressed && keyPressed == true && key=='o'){
     //draws selected color in an ellipse shape when both mouse and the O key 
     //is being pressed 
   stroke(0); // set the stroke colour to a white
    fill(222,183, 220); // set the fill colour to pink with transparency
    ellipse(mouseX, mouseY, random(6), random(6));
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