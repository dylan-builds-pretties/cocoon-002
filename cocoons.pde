

class Cocoon {
  
  Cocoon(PShape d){
  d = createShape();
  d.beginShape();
  d.noFill();
  d.stroke(255,(stringSmoothed+voxSmoothed+padSmoothed)*1000);
  for (float a = 0; a < TWO_PI; a+=0.01) {
   float r = 400;
   float x = r * pow(cos(a),3);
   float y = r * sin(a);
   d.vertex(x*0.5,y);
  }
  d.endShape(CLOSE);
  }
 
  
}
