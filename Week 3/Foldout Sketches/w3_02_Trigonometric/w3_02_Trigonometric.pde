/*
 * Creative Coding
 * Week 3, Foldout 02: Processing functions
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This program illustrates the use of the Processing funcions:
 * sin, cos
 *
 * In this sketch the angle (in degrees) is equal to the current frame number,
 * so the functions cycle every 360 frames.
 *
 * See the foldout associated with this sketch for more details
 * 
 */

float ballX, ballY; // position of a ball on a circle
float centerX, centerY; // center of the circle
float radius; // radius of the circle

void setup() {
  size(800, 300);
  centerX = 120;
  centerY = height/2;
  radius = 100;
}


void draw() {
  background(255);

  // calculate the angle in degrees based on the frame number
  float angleInDegrees = frameCount % 360;

  // now convert to radians using the radians function
  float angleInRadians = radians(angleInDegrees);

  // calculate the ball position around the circle
  ballX = centerX + radius*cos(angleInRadians);
  ballY = centerY - radius*sin(angleInRadians); // value is subtracted here because in processing y coordinates go from top to bottom

  // draw axes
  stroke(0, 30);
  line(0, centerY, width, centerY);
  line(centerX, 0, centerX, height);

  //circle
  noFill();
  stroke(0);
  ellipse(centerX, centerY, radius*2, radius*2);

  //line between center to rotating ball
  stroke(180);
  line(centerX, centerY, ballX, ballY);

  // draw cos component in x
  stroke(0, 0, 255);
  line(centerX, ballY, ballX, ballY);

  // draw sin component in y
  stroke(255, 0, 0);
  line(ballX, centerY, ballX, ballY);

  //rotating ball
  fill(255);
  stroke(0);
  ellipse(ballX, ballY, 10, 10);

  //centerPoint
  fill(0);
  ellipse(centerX, centerY, 5, 5);

  //plot the cos and sin curve to the right to the circle
  for (int x=0; x<360; x++) {
    // calculate the x position along the x axis
    float plotX = radians(x);

    // cos(x) is in blue
    stroke(0, 0, 255);
    point( 250 + x, height/2 - radius*cos(plotX) ); // y increases going down so subtract 

    // sin(x) is in red
    stroke(255, 0, 0);
    point( 250 + x, height/2 - radius*sin(plotX) );
  }


  // angle is the current angle in radians
  float cosBallX = 250 + angleInDegrees;
  float cosBallY = height/2 - radius*cos(angleInRadians);
  float sinBallX = 250 + angleInDegrees;
  float sinBallY = height/2 - radius*sin(angleInRadians);

  noStroke();

  // blue ball moves on the cosine curve
  fill(0, 0, 255);
  ellipse(cosBallX, cosBallY, 5, 5);

  // red ball moves on the sine curve
  fill(255, 0, 0);
  ellipse(sinBallX, sinBallY, 5, 5);

  // draw the bars showing the value for each function
  fill(0, 0, 255);
  rect(670, height/2, 30, -radius*cos(angleInRadians) );

  fill(255, 0, 0);
  rect(635, height/2, 30, -radius*sin(angleInRadians) );
}