/*
 * Creative Coding
 * Week 2, Foldout 04: Basic Mouse Interaction
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This sketch shows how to do interaction with the mouse.
 * Try pressing, releasing, clicking and dragging the mouse and observe the results.
 * When each event happens the sketch also prints a message in the console.
 *
 */
 
int circleWidth;
int strokeWeightValue;
int backgroundValue;
int strokeColorValue;
boolean buttonOn;

void setup() {
  size(300, 300);
  circleWidth = 50;
  backgroundValue = 120;
  strokeWeightValue = 40;
  strokeColorValue = 80;
  fill(255,0,0);
}

void draw() {
  background(backgroundValue);
  stroke(strokeColorValue);
  strokeWeight(strokeWeightValue);
  ellipse(150, 150, circleWidth, circleWidth);
  
  if(mousePressed){
     strokeColorValue = 50 + mouseY/5;
  }

}

void mousePressed() {
  println("The mouse button was pressed");
  
  circleWidth = 150;
}

void mouseReleased() {
  println("The mouse button was released");
  circleWidth = 50;
}

void mouseClicked() {
  println("The mouse button was clicked");
  if (buttonOn) {
    fill(255,0,0);
    buttonOn = false;
  }else{
    fill(0,255,0);
    buttonOn = true;
  }
}

void mouseDragged(){
  println("The mouse is being dragged");
  strokeWeightValue = mouseX/10;
}