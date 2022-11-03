class ray{
  
  PVector a, dir;

  ray(int x, int y){
  
    a = new PVector(x,y);
    dir = new PVector(100,0);
  
  }

  void show(){
  
    stroke(255);
    
    line(a.x,a.y,a.x+100,a.y+0);
  
  }
  
  boolean intersect(barrera bar){
    //https://www.iteramos.com/pregunta/2324/como-se-detecta-donde-se-cruzan-dos-segmentos-de-linea
    // s(x2-x1) - t(x4-x3) = x3-x1       x1 y1 = t1    
    // s(y2-y1) - t(y4-y3) = y3-y1       x2 y2 = t2    
  
    // x1 = a.x   y1 = a.y   x2 = dir.x   y2 = dir.y
    // x3 = ba.a.x   y3 = bar.a.y   x4 = bar.b.x   y4 = bar.b.y
    // AX+BY = C
    // DX+EY = F 
    
    float x1 = a.x;
    float y1 = a.y;
    float x2 = dir.x;
    float y2 = dir.y;
    
    float x3 = bar.a.x;
    float y3 = bar.a.y;
    float x4 = bar.b.x;
    float y4 = bar.b.y;
    
    float x11 = x2-x1;
    float y11 = x4-x3;
    float x22 = y2-y1;
    float y22 = y4-y3;
    
    float t1 = x3-x1;
    float t2 = y3-y1;
    
    float s = ((t1 * y22) - (y11 * t2)) / ((x11 * y22) - (y11 * x22));
    float t = ((x11 * t2) - (t1 * x22)) / ((x11 * y22) - (y11 * x22));
     
     
    
    println("s" + s);
    println("t" + t);
    
    return true;
  }
  
}
