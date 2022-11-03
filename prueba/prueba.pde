int cols; //Columnas
int rows; //Filas
int scale = 5;
float f = 0;
float xoff = 0;

float rotation = 0;

int w = 800; //anchura
int h = 800; //altura

float[][] terrainCords;

void setup(){
  
  cols = w / scale;
  rows = h / scale;

  size(801,801,P3D);
   

}

void draw(){
  
  f += 0.01;
  float yoff = f;
  
  terrainCords = new float[cols][rows];
  for(int y = 0; y < rows; y++){
     float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrainCords[x][y] = map(noise(xoff,yoff),0,1,-100,100);
      xoff += 0.03;
    }
    yoff += 0.03;
  }
      
  background(0);  
  noFill();
  stroke(255);
  
  translate(width/2,height/2);
  rotateX(PI/3);
  translate(-w/2,-h/2);

  
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
      for(int x = 0; x< cols;x++){
         fill(0,terrainCords[x][y]/1.5 + 75,0);
        //vertex(x * scale, y * scale);
        vertex(x * scale, y * scale, terrainCords[x][y]);
        vertex(x * scale, (y+1) * scale,terrainCords[x][y+1]);
      }
    endShape();
  
  }
  
  

}
