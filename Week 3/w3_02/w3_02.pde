/*
 * Creative Coding
 * Week 3, 02 - array with sin()
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This program demonstrates the use of arrays.
 * It creates three arrays that store the y-position, speed and phase of some oscillating circles.
 * You can change the number of circles by changing the value of num in setup()
 * You can change the background colour by holding the left mouse button and dragging.
 * 
 */
float[] grayValueForArray;


int     noCircles;    // the number of items in the array (# of circles)
float[] y;      // y-position of each circle (fixed)
float[] speed;  // speed of each circle
float[] phase;  // phase of each circle

float red = 120;
float green = 120;
float blue = 120;

void setup() {
  size(500, 500);


  noCircles = 20;

  // allocate space for each array
  y = new float[noCircles];
  speed = new float[noCircles];
  phase = new float[noCircles]; 

  // calculate the vertical gap between each circle based on the total number of circles
  float gap = height / (noCircles + 1);

  //setup an initial value for each item in the array
  for (int i=0; i<noCircles; i++) {
    y[i] = gap * (i + 1);      // y is constant for each so can be calculated once
    speed[i] = random(6);
    phase[i] = random(TWO_PI );
  }
  
   //Initiate Array
   grayValueForArray = new float[noCircles];
   //Input value into Array
   for (int i=0; i<noCircles; i++) {
   grayValueForArray[i] = 11*i;
   }
}


void draw() {
  background(red, green, blue);

  for (int i=0; i<noCircles; i++) {
    // calculate the x-position of each ball based on the speed, phase and current frame
    float x = width/2 + sin(radians(frameCount*speed[i] ) + phase[i])* 55;
    ellipse(x, y[i], 20, 20);
    fill( grayValueForArray[i] - 25, 140, 125);
    //rgb
  }
  // save your drawing when you press keyboard 's'
  if (keyPressed == true && key == 's') {
    saveFrame("map.jpg");
  }
}


// change the background colour if the mouse is dragged
void mouseDragged() {
  red = map(mouseX, 0, width, 0, 255);
  green = map(mouseY, 0, height, 0, 255);
  blue = map(mouseX+mouseY, 0, width+height, 255, 0);
}