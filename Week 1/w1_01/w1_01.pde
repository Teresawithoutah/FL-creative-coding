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
//varible to call aka referencing image
PImage img;

// setup function -- called once when the program begins
void setup() {

  // set the display window to size 500 x 500 pixels
  size(500, 500);

  // set the background colour to white
  background(0);

  // set the rectangle mode to draw from the centre with a specified radius
  rectMode(RADIUS);
  
  // loads image thats saved in correct directory
  img = loadImage("large.png");
}


// draw function -- called continuously while the program is running
void draw() {

  /* draw a rectangle at your mouse point while you are pressing 
   the left mouse button */

  if (mousePressed) {
    // draw a rectangle with a small random variation in size
    stroke(0); // set the stroke colour to a white
    fill(0,118,0,150); // set the fill colour to green with transparency
    rect(mouseX, mouseY, random(8), random(8));
  }
  if (mousePressed && keyPressed == true && key=='q'){
    //draws selected color when both mouse and the q key is being pressed
   stroke(0); // set the stroke colour to a white
    fill(0,189,0,150); // set the fill colour to lighter green with transparency
    rect(mouseX, mouseY, random(13), random(13));
  } 
  
   if (mousePressed && keyPressed == true && key=='w'){
     //draws selected color when both mouse and the w key is being pressed
   stroke(0); // set the stroke colour to a white
    fill(185,202, 0); // set the fill colour to yellow with transparency
    ellipse(mouseX, mouseY, random(24), random(24));
  }
  
  if (mousePressed && keyPressed == true && key=='e'){
     //draws selected color when both mouse and the e key is being pressed
   stroke(0); // set the stroke colour to a white
    fill(0,54, 0); // set the fill colour to dark green with transparency
    ellipse(mouseX, mouseY, random(24), random(24));
  }
  
  if (mousePressed && keyPressed == true && key=='a'){
    //draws selected color when both mouse and the a key is being pressed
   stroke(0); // set the stroke colour to a white
    fill(255,150); // set the fill colour to white with transparency
    rect(mouseX, mouseY, random(13), random(13));
  } 
  
  if (mousePressed && keyPressed == true && key=='z'){
    //heart image is used 
   image(img,mouseX,mouseY, random(200), random(250));
    
  }  
  
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
    saveFrame("creation1.jpg");
 // you can edit file name here ^  
}

  // erase your drawing when you press keyboard 'r'
  if (keyPressed == true && key == 'r') {
    background(0);
  }
}