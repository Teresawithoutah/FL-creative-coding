/*
 * Creative Coding
 * Week 4, Foldout 02: Random, Noise and Gaussian
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This program illustrates the use of different methods for generating randomness in Processing
 * See the foldout associated with this sketch for more details
 * 
 */   


void setup() {
  size(400, 700);
  frameRate(1);
}

void draw() {
  background(255);

  int barNo = width; //Number of noise sample bars
  float noiseOff = 0;
  
  // noise
  for (int i=0; i< barNo; i+=5) {
    float y = 150*noise(noiseOff);
    line(i, 150, i, y);
    fill(0);
    ellipse(i,y, 3, 3);
    noiseOff += 0.05;
  }

  // random
  for (int i=0; i< barNo; i+=5) {
    float y = random(100);
    line(i,350, i, 350-y);
    ellipse(i, 350-y,3,3);
  }

  // randomGaussian
  for (int i=0; i< barNo; i+=5) {
    float y = 50*randomGaussian();
    line(i, 540,i, y+540);
    ellipse(i, y+540, 3,3);
  }
  

}