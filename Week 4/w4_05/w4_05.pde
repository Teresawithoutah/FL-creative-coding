/*
 * Creative Coding
 * Week 4, 05 - noise-based spinning top
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This sketch is a different cut of the spinning top example from week 3
 * It uses the noise function to change the direction of the path
 *
 */

// the two variables below shift the position in the noise field, 
// allowing the value returned by the noise() function to change.
float noiseOffX = 0;
float noiseOffY = 0;


void setup(){
  size(500,500);
  background(0);
}


void draw() {
  
  // add a small increment to the offsets
  // (change these numbers and look at the visual results)
  noiseOffX += 0.005;
  noiseOffY += 0.003;
  
  // location of the ellipse
  float x = width * noise(noiseOffY * 0.5);
  float y = height * noise(noiseOffX * 0.5);
  
  ellipse(x, y, 2, 2);
  
  // angle changes with time
  float angle = radians(frameCount);
  
  // radius changes with noise
  float radius = 100 * noise(noiseOffX);
  
  // calculate positions at the rotation point
  float rotateX = x + radius * cos(angle);
  float rotateY = y + radius * sin(angle);
  
  stroke(255,15);
  line(x, y, rotateX, rotateY);
  ellipse(rotateX, rotateY, 1, 1);
  
}