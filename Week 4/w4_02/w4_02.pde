/*
 * Creative Coding
 * Week 4, 02 - images as textures - image drawing program
 * by Indae Hwang and Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This program demonstrates the use of images in Processing
 * See also the foldout: Image Basics in Processing
 *
 * Keyboard interaction:
 * key 'd' = delete drawing
 * key LEFT and RIGHT = De/Increase Image size
 * key '1' and '2' = change image
 *
 */

PImage[] myImage;    // PImage is used to store an image in memory
float scaleOfImage;  // current scale of the image
PImage bgImage;      // display window image
int selectedImageNum;

void setup() {
  size(800, 800);  

  // allocate a new array with space for two images
  myImage = new PImage[2];
  myImage[0] = loadImage("sample_01.png");
  myImage[1] = loadImage("sample_02.png");
  bgImage = createImage(width, height, RGB);
  resetImage();
  // set initial scale to be 0.5 and use the first image (index 0)
  scaleOfImage = 0.5;
  selectedImageNum = 0;
}

void draw() {
  // note this new kind of arguement to background - an image!
  background(bgImage);

  // left and right arrow keys to scale the image
  if ( keyPressed ) {
    if (keyCode == LEFT) {
      scaleOfImage -= 0.01;
    } 
    else if (keyCode == RIGHT) {
      scaleOfImage += 0.01;
    }
  }

  // draw image according to current scale and mouse position
  pushMatrix();
  translate(mouseX, mouseY);
  float scaleValue = constrain(scaleOfImage, 0.05, 6);
  scale(scaleValue); 
  rotate(radians(frameCount));
  imageMode(CENTER);
  image(myImage[selectedImageNum], 0, 0);
  popMatrix();
  if(mousePressed){
    loadPixels();
    bgImage.loadPixels();
    bgImage.pixels = pixels;
    bgImage.updatePixels();  
  }
  // if the mouse is pressed load the image into the main background image
}

void resetImage(){
  bgImage = createImage(width, height, RGB);
    bgImage.loadPixels();
    for (int i = 0; i < bgImage.pixels.length; i++) {
      bgImage.pixels[i] = color(255, 255, 255); 
    }
  bgImage.updatePixels();
}

void keyReleased() {
  if (key == 'd') {
    resetImage();
  }
  else if (key == '1') {
    selectedImageNum = 0;
  }
  else if (key == '2') {
    selectedImageNum = 1;
  }
}