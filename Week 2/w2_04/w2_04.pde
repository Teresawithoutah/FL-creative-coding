/*
 * Creative Coding
 * Week 2, 04 - The Clocks!
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This program draws a grid of circular "clocks", whose hands move according to the elasped time.
 * The higher the clock number the faster it moves, the first clock takes 1 min to go all the way around.
 * The function "movingCircle" is used to draw each clock. It is passed the position, size and hand angle
 * as arguments.
 *
 * Updated version: this updated version correctly sets margin and gutter distances
 * 
 */

void setup() {
  size(600, 600);
  background(180);
  rectMode(CENTER);
  ellipseMode(CENTER);
  noStroke();
}


void draw() {
  background(180);
  noStroke();

  int gridSize = 3;  // the number of rows and columns
  int margin = 20; // margin between the edges of the screen and the circles

  float gutter = 10; //distance between each cell
  float cellsize = ( width - (2 * margin) - gutter * (gridSize - 1) ) / gridSize; // size of each circle

  int circleNumber = 0; // counter

  for (int i=0; i<gridSize; i++) { // column in y
    for (int j=0; j<gridSize; j++) { // row in x
      ++circleNumber;

      float tx = margin + cellsize/2  + (cellsize + gutter) * j;
      float ty = margin + cellsize/2  + (cellsize + gutter) * i;

      movingCircle(tx, ty, cellsize, circleNumber * TWO_PI * millis() / 60000.0);
    }
  }
  
   // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("circles.jpg");
  }

}//end of draw 


void movingCircle(float x, float y, float size, float angle) {
//  PVector mouse = new PVector(mouseX,mouseY);
 
  // calculate endpoint of the line
  float endpointX = x + (size / 2) * sin(angle) ;
  float endpointY = y + (size / 2) * cos(angle);
 
  stroke(255);
  strokeWeight(9);
  fill(random(0, 255), random(0, 255), random(200, 255));
  ellipse(x, y, size, size); // circle


  
  stroke(0);
  line(x, y, endpointX, endpointY); // yellow line
}