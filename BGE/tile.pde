class tile{
  
  int tLargo = 50;
  int x,y,z;
  float initAngle;
  float angle;
  String c;
  
  int x1,x2,y1,y2;
  
  int r;
  
  PFont fuenteBGE;
  
  tile(int z,float angle, int r, String c, PFont fuenteBGE, float initAngle){
    
    this.z = z;
    this.angle = (angle * (PI / 180)); //Conversion a radianes
    
    this.c = c;
  
    this.r = r;
    
    this.fuenteBGE = fuenteBGE;
    
  }
 
  void show(){
    
      int alpha = 0;  //Convierte z de un rango -250,250 a 0,255 para usarlo en el alpha
      
      if(z >= initAngle-45){ //205
        
        alpha = int(map(z,initAngle-45,300,255,150));
      
      }else{
      
          alpha = int(map(z,-300,initAngle-45,0,255));

      }
  
      x = int(cx + (r/2 * cos(angle))); //X centro tile 
      y = int(cy + (r/2 * sin(angle))); //Y centro tile
      
      //   10*------------*11
      //    |             | 
      //    |             |
      //    |             |
      //    |             | 
      //   20*------------*21
      
      int angleRange = 7;
      int largo = 70/2;
      
      int x10 = int(cx + (((r/2) - largo) * cos(angle - (angleRange *(PI/180)))));
      int y10 = int(cy + (((r/2 - largo)) * sin(angle - (angleRange * (PI/180)))));
      
      int x11 = int(cx + (((r/2) + largo) * cos(angle - (angleRange *(PI/180)))));
      int y11 = int(cy + (((r/2 + largo)) * sin(angle - (angleRange * (PI/180)))));
      
      int x20 = int(cx + (((r/2) - largo) * cos(angle + (angleRange *(PI/180)))));
      int y20 = int(cy + (((r/2 - largo)) * sin(angle + (angleRange * (PI/180)))));
      
      int x21 = int(cx + (((r/2) + largo) * cos(angle + (angleRange *(PI/180)))));
      int y21 = int(cy + (((r/2 + largo)) * sin(angle + (angleRange * (PI/180)))));
      
      
      //--------------------------------Punto Centro Tile----------------------------------------

      strokeWeight(10);
      stroke(0,255,0);
      point(x,y,z); //Punto centro
      
      //---------------------------------------Tile----------------------------------------------
      
      fill(77,122,127,alpha);
      strokeWeight(5);
      stroke(105,179,179,alpha);
      
      beginShape();
        vertex(x10,y10,z);
        vertex(x11,y11,z);
        vertex(x21,y21,z);
        vertex(x20,y20,z);
      endShape(CLOSE);
      
      fill(255,255,255,alpha);
      textSize(40);
      textFont(fuenteBGE);
      text(c,x-10,y+10,z);
      
  }
  
  void moveUp(int times){
    
    if(times != 1){
    
      this.z += 15 * times;
      this.angle += ((15 * times)*PI/180);
      
    }else{
    
       this.z += 15 * times;

      
    }



  }
  
  void moveDown(int times){
    
    if(times != 1){
      this.z -= 15 * times;
      this.angle -= ((15 * times)*PI/180);
    }else{
      this.z -= 15 * times;
    }
  


  }
  


}
