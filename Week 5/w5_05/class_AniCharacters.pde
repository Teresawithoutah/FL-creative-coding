// AniCharacter class
//
// 
class AniCharacter {

  float x, y;      // location
  float offsetX;   // position in the noise field
  float offsetY;
  float dynamic;   // how 'dynamic' this char is
  float dynamic_c;
  float size_font;
  float size_shape;
  char letter;

  AniCharacter(float x_, float y_, char c_) {

    x = x_;
    y = y_;
    
    // select a random starting position in the noise field
    offsetX = random(3000);
    offsetY = random(3000);

    letter = c_;
    size_font = random(50, 200);
    size_shape = size_font + random(10, 50);
    dynamic_c = random(-0.1, 0.1);
  }

  void run() {

    switch(letter) {
    case 'a':
      dynamic -= dynamic_c;
      break;
    case 'c':
      dynamic += dynamic_c;
      break;
    case 'e':
      dynamic += dynamic_c;
      break;
    }

    // speed of motion
    offsetX += 0.0005;
    offsetY += 0.0003;

    // change the letter's position by moving slowly around a noise field
    x = width * noise(offsetX);
    y = height * noise(offsetY);

    visual();
  }

  /*
   * visual
   * draw the char with special cases for some letters
   */
  void visual() {

    textSize(size_font);
    float textWidth =  textWidth(letter);
    float ascent = textAscent() * 0.75;

    switch(letter) {
    case 'a':

      fill(0);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);

      stroke(0);
      noFill();
      pushMatrix();
      translate(x, y);
      rotate(dynamic);
      arc(0, 0, size_shape, size_shape, HALF_PI, PI+HALF_PI);
      popMatrix();
      break;

    case 'c':
      fill(0);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);

      float tempx = x + size_shape*cos(dynamic*0.5);
      float tempy = y + size_shape*sin(dynamic*0.5);
      fill(255, 0, 0);
      stroke(255, 0, 0, 140);
      line(x, y, tempx, tempy);
      noStroke();
      ellipse(tempx, tempy, 10, 10);
      break;

    case 'e':
      rectMode(CENTER);
      fill(0);
      rect(x, y, textWidth, size_shape*sin( radians(dynamic) ));
      rectMode(CORNER);

      fill(255);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);
      break;

    default:
      fill(0);
      noStroke();
      text(letter, x-textWidth/2, y+ascent/2);
      break;
    }
  }
}