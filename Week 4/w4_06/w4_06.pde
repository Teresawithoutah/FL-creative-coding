/*
 * Creative Coding
 * Week 4, 06 - visualising noise
 * by Jon McCormack
 * Updated 2016
 * Copyright (c) 2014-2016 Monash University
 *
 * This sketch draws an image using two different version of "noise"
 * The brighness of the pixel represent the value of the noise.
 * Click and drag to pan the noise field around.
 *
 * Key Commands:
 * UP ARROW  - increase the value of noiseScale
 * DOWN ARROW - decreate the value of noiseScale
 * 1  - select Processing's built-in 'noise' function
 * 2  - select Ken Perlin's noise function
 * r  - reset all values
 * d  - decrease noise detail
 * D  - increase noise detail
 * f  - decrease falloff
 * F  - increse falloff
 * q  - quit the sketch
 *
 */
 
float cx, cy;               // current location of noise
float noiseScale = 0.02;
int noiseD = 0;             // detail
float falloff = 0.5;
PImage img;                 // image to hold a picture of noise
boolean useInoise = false;  // if true then use Perlin's noise function

void setup() {
  size(500, 500);
  inoise_setup(); //must be called before any calls to inoise
  img = createImage(width, height, RGB);
  cx = cy = 0;
  img.loadPixels();
  background(0);
}

void draw() {
  background(img);
  // img.loadPixels();
  for (int y = 0; y < height; ++y)
    for (int x = 0; x < width; ++x) {
      float noiseValue = calcNoise(cx + x * noiseScale, cy + y * noiseScale) * 255;
      img.pixels[ y * width + x ] = color(noiseValue, noiseValue, noiseValue);
    }
  img.updatePixels();
}

/*
 * return 2D noise at (x,y) based on current state settings
 */
float calcNoise(float x, float y) {
  if (!useInoise) return noise(x, y);

  if (noiseD > 0)
    return turbulence(x, y, 0.0, noiseD, falloff);
  else
    return inoisef2(x, y, 0.0);
}

/*
 * mouseDragged
 * implements simple panning of the noise field
 */
void mouseDragged() {
  cx -= (mouseX - pmouseX) * noiseScale;
  cy -= (mouseY - pmouseY) * noiseScale;
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      noiseScale *= 2;
    } 
    else if (keyCode == DOWN) {
      noiseScale /= 2;
    }
  } 
  else {
    boolean nd = false;
    switch (key) {
    case '1':
      useInoise = false;
      break;

    case '2':
      useInoise = true;
      break;

    case 'r':
      noiseScale = 0.02;
      noiseD = 0;
      falloff = 0.5;
      useInoise = false;
      break;

    case 'd':
      noiseD = noiseD <= 0 ? 0 : noiseD - 1;
      nd = true;
      break;

    case 'D':
      noiseD += 1;
      nd = true;
      break;

    case 'f':
      falloff = falloff < 0 ? 0.0 : falloff - 0.1;
      nd = true;
      break;

    case 'F':
      falloff = falloff > 1.0 ? 1.0 : falloff + 0.1;
      nd = true;
      break;

    case 'q':
      exit();
      break;
    }
    if (nd) {
      noiseDetail(noiseD, falloff);
      print("Noise detail = ", noiseD);
      print(", falloff = ", falloff);
      println(", using ", (useInoise ? "Perlin noise" : "Procssing noise"));
    }
  }
}