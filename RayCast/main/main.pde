barrera b1,b2,b3;
ray r1;

void setup(){
  
  b1 = new barrera(0,0,200,300);
  b2 = new barrera(800,0,500,600);
  b3 = new barrera(100,600,500,750);
  
  r1 = new ray(90,250);

  size(800,800);

}

void draw(){

  background(0);
  b1.show();
  b2.show();
  b3.show();
  
  r1.show();
  r1.intersect(b1);
  
  circle(mouseX,mouseY,15);
  
}
