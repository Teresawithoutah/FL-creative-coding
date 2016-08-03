/*
 * Creative Coding
 * Week 3, 01 - using map() to map mouse co-ordinates to background colour 
 * by Indae Hwang
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This program allows you to change the background color.
 * Press and hold 'left mouse button' to change color.
 * 
 */

float red;
float green;
float blue;


void setup() {
  size(500, 500);

  // initialise the colour variables
  red = 0;
  blue = 0;
  green = 0;
}


void draw() {
  background(red, green, blue);

  if (mousePressed) {
    red = map(mouseX, 0, width, 0, 255);
    green = map(mouseY, 0, height, 0, 255);
    blue = map(mouseX+mouseY, 0, width+height, 255, 0);
    
    println("red: "+red+", green: "+green+", blue: "+blue);
    
  }
}