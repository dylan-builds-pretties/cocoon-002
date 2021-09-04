
int numCirclesLeft = 7;
int numCirclesRight = 7;

Circle[] circlesLeft = new Circle[numCirclesLeft];
Circle[] circlesRight = new Circle[numCirclesRight];

float time = second();

class Circle {
  float x, y; // location

  Circle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void displayA() {
    float fadeIn = 0;
    fadeIn =+ frameCount/4;
    if(fadeIn > 80){
      fadeIn = 59;
    }
    //strokeWeight(1+(pianoSmoothed*5));
    stroke(255,fadeIn + (pianoSmoothed*500));
    if(bansuriSmoothed > 0.01 && millis() > 169400){
      fill(200, 10, 20 + bansuriSmoothed*100,bansuriSmoothed*500);
    }
    circle(x, y, 540); // a circle at position xy
  }
  void displayB() {
    float fadeIn = 0;
    fadeIn =+ frameCount/8;
    if(fadeIn > 80){
      fadeIn = 79;
    }
    //stroke(255,fadeIn + (pianoSmoothed*500));
    circle(x, y, 540); // a circle at position xy
  }
  void displayC() {
    float fadeIn = 0;
    fadeIn =+ frameCount/12;
    if(fadeIn > 80){
      fadeIn = 79;
    }
    stroke(255,fadeIn + (pianoSmoothed*500));
    circle(x, y, 540); // a circle at position xy
  }
  void displayD() {
    float fadeIn = 0;
    fadeIn =+ frameCount/14;
    if(fadeIn > 80){
      fadeIn = 79;
    }
    //stroke(255,fadeIn + (pianoSmoothed*500));
    circle(x, y, 540); // a circle at position xy
  }
  void displayE() {
    float fadeIn = 0;
    fadeIn =+ frameCount/15;
    if(fadeIn > 80){
      fadeIn = 79;
    }
    stroke(255,fadeIn + (pianoSmoothed*500));
    circle(x, y, 540); // a circle at position xy
  }
  void displayF() {
    float fadeIn = 0;
    fadeIn =+ frameCount/16;
    if(fadeIn > 80){
      fadeIn = 79;
    }
   // stroke(255,fadeIn + (pianoSmoothed*500));
    circle(x, y, 540); // a circle at position xy
  }
  void displayG() {
    float fadeIn = 0;
    fadeIn =+ frameCount/17;
    if(fadeIn > 80){
      fadeIn = 79;
    }
    stroke(255,fadeIn + (pianoSmoothed*500));
    circle(x, y, 540); // a circle at position xy
  }
  void moveUp() {
    y = y + 0.25;
  } 
  void moveDown() {
    y = y - 0.25;
  }
  void moveLeft(){
    x = x - 0.25;
  }
  void moveRight(){
   x = x + 0.25; 
  }
}
