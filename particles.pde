class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(PVector l) {
    acceleration = new PVector(0,0.05);
    velocity = new PVector(random(-1,1),random(-2+1*amp[2].analyze(),0+1*amp[2].analyze()));
    location = l.get();
    lifespan = 255.0;
  }
  
   
  void run() {
    update();
    display();
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 4.0+(amp[8].analyze()*(-10));
  }
 
  void display() {
    noStroke();
    stringSmoothed = stringSmoothed * 0.9 + amp[2].analyze() * 0.1;
    fill(245,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
  
