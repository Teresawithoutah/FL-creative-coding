/*
 * Creative Coding
 * Week 2, 03 - n squares
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * In the next iteration of the square drawing sketch, this version selects a random number of squares
 * and a random gap between them. From this it calculates the width of each square then draws the squares
 * using two nested for loops.
 *
 * A simple drop shadow is also drawn to give the illusion of depth.
 * 
 */

void setup() {
  size(600, 600);
  //rectMode(CORNER);
  noStroke();
  frameRate(1);  // set the frame rate to 1 draw() call per second
}


void draw() {

  background(255); // clear the screen to grey
  
  int gridSize = (int) random(2, 12);   // select a random number of squares each frame
  int gap = (int) random(5, 50); // select a random gap between each square
  
  // calculate the size of each square for the given number of squares and gap between them
  float cellsize = ( width - (gridSize + 1) * gap ) / (float)gridSize;
  
  // print out the size of each square
  println("cellsize = " + cellsize);
  
  // calculate shadow offset
  float offsetX = cellsize/18.0;
  float offsetY = cellsize/18.0;
 

    for (int i=0; i<gridSize; i++) {
      for (int j=0; j<gridSize; j++) {

        fill(12, 0, 120); // color shadow
        rect(gap * (i+1) + cellsize * i + offsetX, gap * (j+1) + cellsize * j + offsetY, cellsize, cellsize);

       fill(247, 57, 57, 180); // color rectangle
        rect(gap * (i+1) + cellsize * i, gap * (j+1) + cellsize * j, cellsize, cellsize);
      
       
    }
    }
    
      // save your drawing when you press keyboard 's'
  if (keyPressed == true && key=='s') {
        saveFrame("yeah.jpg");
     // you can edit file name here ^  
    }

} //end of draw 