import processing.sound.*;
PImage img;
PShape s;
PShape d;
PShape d2;
PVector v = new PVector(200.0,0.0,0.0);

SoundFile[] file;
Amplitude[] amp;
int numsounds = 14;


ArrayList<Particle> particles;
ArrayList<Circle> circlesLeft_;

float guitarSmoothed;
float voxSmoothed;
float voxSmoothed2;
float stringSmoothed;
float bangSmoothed;
float pianoSmoothed;
float harmSmoothed1;
float harmSmoothed2;
float padSmoothed;
float finalChorusSmoothed;
float bansuriSmoothed;

void setup(){
  size(1080,1080,FX2D);
  
  particles = new ArrayList<Particle>();
  circlesLeft_ = new ArrayList<Circle>(); //possible arraylist to create guitar string circles?
  
  
  //img = loadImage("cocoon2.png");
  file = new SoundFile[numsounds];
  amp = new Amplitude[numsounds];
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".wav");
    amp[i] = new Amplitude(this);
    amp[i].input(file[i]);
  }
  
  for (int i = 0; i < numsounds; i++) {
    file[i].play();
  } 
  
  //activate circle class
  for (int i=0; i<numCirclesLeft; i++) {
    circlesLeft[i] = new Circle(270,200+i*100); 
  }
  for (int i=0; i<numCirclesRight; i++) {
    circlesRight[i] = new Circle(810,300+i*100); 
  }
  
  //START COCOON
  s = createShape();
  s.beginShape();
  s.noFill();
  s.stroke(255);
  for (float a = 0; a < TWO_PI; a+=0.01) {
   float r = 400;
   float x = r * pow(cos(a),3);
   float y = r * sin(a);
   s.vertex(x*0.5,y);
  }
  s.endShape(CLOSE);
  
  d = createShape();
  d.beginShape();
  d.noFill();
  d.stroke(255);
  for (float a = 0; a < TWO_PI; a+=0.01) {
   float r = 400;
   float x = r * pow(cos(a),3);
   float y = r * sin(a);
   d.vertex(x*0.5,y);
  }
  d.endShape(CLOSE);
  
  d2 = createShape();
  d2.beginShape();
  d2.stroke(255);
  d2.noFill();
  for (float a = 0; a < TWO_PI; a+=0.01) {
   float r = 400;
   float x = r * pow(cos(a),3);
   float y = r * sin(a);
   d2.vertex(x*0.5,y);
  }
  d2.endShape(CLOSE);
}

void draw() {
  background(0);
  
  //Bansuri create fountain particle system
 noStroke();
 if(amp[2].analyze() > 0.001){
 particles.add(new Particle(new PVector(width/2,50)));
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.run();
  }
  if (particles.size() > 10+(500*amp[8].analyze()) + (10*stringSmoothed)){
  particles.remove(0);
  }
 }
  stroke(200);
  
 
  /*
  //circlesLeft
  circle(270,200,540);
  circle(270,300,540);
  circle(270,400,540);
  circle(270,500,540);
  circle(270,600,540);
  circle(270,700,540);
  circle(270,800,540);
  //right side
  circle(810,300,540);
  circle(810,400,540);
  circle(810,500,540);
  circle(810,600,540);
  circle(810,700,540);
  circle(810,800,540);
  circle(810,900,540);
  */
  
  //START CIRCLE CONDITIONAL MOVEMENT STATEMENTS
  noFill();

    strokeWeight(1+(pianoSmoothed*10));
 
      circlesLeft[0].displayA();
      circlesLeft[1].displayB();
      circlesLeft[2].displayC();
      circlesLeft[3].displayD();
      circlesLeft[4].displayE();
      circlesLeft[5].displayF(); //size attach to string amp
      circlesLeft[6].displayG();
      
      circlesRight[0].displayG();
      circlesRight[1].displayF();
      circlesRight[2].displayE();
      circlesRight[3].displayD();
      circlesRight[4].displayC();
      circlesRight[5].displayB(); //size attach to string amp
      circlesRight[6].displayA();  

    
  //Main VoxCircle
  strokeWeight(1+voxSmoothed*20);
  fill(255,voxSmoothed*500);
  circle(540,540,100*(voxSmoothed+1.3));
  //2nd Verse VoxCircle
  if(millis() > 108800){ //sometimes shows too early??
    stroke(255-(voxSmoothed*10),voxSmoothed2*200);
    strokeWeight(voxSmoothed2*20);
    circle(540,540,40*(voxSmoothed2+1.5)); 
  }
  
  pushMatrix();
  translate(width/2,height/2);
  //if strings are loud, then rotate cocoon shape
  if(millis() < 80050){
    if(amp[2].analyze() > 0.004){
      s.rotate(-0.005); 
    }
  //REGULAR COCOON SHAPE
    shape(s);
  }
  //2 rotating finale cocoons 
  else if(millis() > 170000 && amp[7].analyze() + amp[6].analyze()+ finalChorusSmoothed > 0.01){
    
    if(amp[7].analyze() + amp[6].analyze() > 0.01){
      d2.rotate(0.005); 
      d.rotate(-0.005);
    }
    shape(d2);
    shape(d);
  }
   
 
  //START THEN AGAIN COCOON HARMONIES
  if(amp[11].analyze() > 0.01 || amp[10].analyze() > 0.01){
    beginShape();
      stroke(255,(amp[11].analyze() * 200) + (amp[10].analyze() * 500));
      strokeWeight(1 + (amp[11].analyze() * 100) + (amp[10].analyze() * 300));
      for (float a = 0; a < TWO_PI; a+=0.01) {
       float r = 50;
       float x = r * pow(cos(a),3);
       float y = r * sin(a);
       vertex((x*0.5)-350,y);
      }
    endShape();
    beginShape();
      stroke(255,(amp[11].analyze() * 200) + (amp[10].analyze() * 500));
      strokeWeight(1 + (amp[11].analyze() * 100) + (amp[10].analyze() * 300));
      for (float a = 0; a < TWO_PI; a+=0.01) {
       float r = 50;
       float x = r * pow(cos(a),3);
       float y = r * sin(a);
       vertex((x*0.5)+350,y);
    }
    endShape();
  }
  
  //ROTATING TRIANGLES FOR CHORUS 2 -> FINAL CHOURS
 /* if(amp[11].analyze() > 0.01 || amp[10].analyze() > 0.01){
    strokeWeight(1);
    stroke(255);
    noFill();
    triangle(-350,-100,-250,75,-450,75);
    
  }*/
 
   popMatrix();
   
   
 //START BANSUUURI RED SHAPE
  if(amp[8].analyze() > 0.01){
  for(int i = 0; i <  25; i++){
    float xorig = 540;
    float yorig = 540;
    float radius = 400; //+ i * 10;
    float angle = millis()/60 * map(i, 0 , 20, 0.05, 0.1);
    float a = xorig + radius * cos(angle*1.6);
    float b = yorig + radius  * sin(angle*2.0);
    noFill();
    if(millis() > 169400 && amp[8].analyze() > 0.01){
     fill(130+(bansuriSmoothed*150), 20, 20+i*5,bansuriSmoothed*500); 
    }
    strokeWeight(1+bansuriSmoothed*20);
    stroke(130+(bansuriSmoothed*150), 20, 20+i*5,bansuriSmoothed*1000);
    ellipse(a,b, 20+bansuriSmoothed*400, 40+bansuriSmoothed*400);
   }
  }
  
    pushMatrix();
    translate(width/2,height/2);
  //PERCUSSION COCOON SHAPE
  if(amp[7].analyze() > 0.001){
    beginShape();
      stroke(255);
      fill(255,voxSmoothed*500);
      strokeWeight(1+amp[7].analyze()*100);
      for (float a = 0; a < TWO_PI; a+=0.01) {
       float r = 400+(100*finalChorusSmoothed);
       float x = r * pow(cos(a),3);
       float y = r * sin(a);
       vertex(x*0.5,y);
    }
    endShape();
  }
  
   //PERCUSSION COCOON THAT GROWS W/ FINAL CHORUS
  if(amp[7].analyze() > 0.001 && millis() > 109000 && millis() < 169000){
    if(millis() > 109000){
      rotate(((frameCount/PI)/60)+0.2);
    }
    beginShape();
      stroke(255);
      noFill();
      strokeWeight(1);//+amp[7].analyze()*50);
      for (float a = 0; a < TWO_PI; a+=0.01) {
       float r = 400; //+ (75*finalChorusSmoothed);
       float x = r * pow(cos(a),3);
       float y = r * sin(a);
       vertex(x*0.5,y);
    }
    endShape();

  }
  popMatrix();
  
  
 
  guitarSmoothed = guitarSmoothed *0.9 + amp[0].analyze()*0.1;
  voxSmoothed = voxSmoothed *0.9 + amp[1].analyze()*0.1;
  voxSmoothed2 = voxSmoothed2 *0.9 + amp[1].analyze()*0.2;
  stringSmoothed = stringSmoothed * 0.8 + amp[2].analyze()*0.2;
  pianoSmoothed = pianoSmoothed * 0.9 + amp[5].analyze()*0.1;
  harmSmoothed1 = harmSmoothed1 * 0.9 + amp[11].analyze()*0.1;
  harmSmoothed2 = harmSmoothed2 * 0.9 + amp[10].analyze()*0.1;
  padSmoothed = padSmoothed * 0.9 + amp[6].analyze() *0.1;
  finalChorusSmoothed = finalChorusSmoothed * 0.9 + amp[13].analyze() * 0.1;
  bansuriSmoothed = bansuriSmoothed * 0.9 + amp[8].analyze() * 0.1;
  
  //println(millis());
}
