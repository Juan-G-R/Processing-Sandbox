int cols; //Colums
int rows; //Rows
int deep; //Deep

int scale = 20;

int w = 800; //Width
int h = 800; //Height
int d = 800; //Deep

float f = 0;
float xoff = 0;

float[][] alturas;
int[][] trees;

int contador = 0;

void setup(){
  
  cols = w / scale;
  rows = h / scale;
  deep = d / scale;
  
  trees = new int[cols][rows];
  alturas = new float[cols][rows];
    
  size(800,800,P3D);
  
}

void draw(){
  
//------------------------------------Terrain Heights Generator------------------------------------

  f += 0.01; 
  float yoff = f;
  
  for(int x = 0; x < rows;x++){
    float xoff = 0;
    for(int y = 0; y < cols; y++){
      alturas[x][y] = int(map(noise(xoff,yoff), 0,1,0,30)); //Perlin Noise
      xoff += 0.03;
    }
    yoff += 0.03;
  }
  
//------------------------------------World Camera Position------------------------------------
  
  translate(width/2, rows/2*scale + height/2);
  rotateY(PI/4);
  rotateX(-0.2);
  rotateZ(-0.2);

//------------------------------------X , Y , Z Loops------------------------------------

  background(0);
  stroke(255);

  for(int z = 0; z < deep;z++){
    if(z == 0 && contador%3 == 0){
      contador =0;
      for(int y = 0; y < rows; y++){
        
        trees[y][rows-1] = int(random(0,200)); //Seleccting if a box have a tree or not with random number 0-200; If the value is 1 a tree will be place
      
      } 
         
      for(int x = 0; x <cols-1; x++){   //Shift trees array
        for(int y = 0; y < rows; y++){
          trees[y][x] = trees[y][x+1]; 
        }  
      }
      
    }
    contador++;
    
    for(int x = 0; x < cols; x++){   
      for(int y = 0;y < alturas[z][x];y++){
        
          if(y < 10){
            fill(65,65,65);
          }else if(y == alturas[z][x]-1){
            fill(0,255,0);
          }else{
            fill(128,128,128);
          }
          
          box(scale);
          translate(0,-scale);
         
          if(y == alturas[z][x]-1){        
            water(y,x,z);
            tree(y,x,z);
          }
      }
      
      translate(scale,(scale*alturas[z][x]));
    }
    
    translate(-(scale*cols),0,-scale);
    
  }  
}

//------------------------------------Water Block Generator------------------------------------

void water(int y,int x,int z){

  if(alturas[z][x]-1 < 10){
    
    fill(0,0,255);
    
    for(int a = y; a < 10; a++){
      box(scale);
      translate(0,-scale);
    }          
    
    translate(0,scale * (10-y)); 
  }
  
}

//------------------------------------Tree Generator------------------------------------

void tree(int y,int x, int z){
  
  if(y > 10 && trees[x][z] == 1){
    
      fill(156,76,0);
      
      for(int a = y; a < y+4; a++){
        box(scale);
        translate(0,-scale);
      }
      
      fill(0,200,0);
      box(scale);
      translate(scale,0);
      box(scale);
      translate(-scale*2,0);
      box(scale);
      translate(scale,0,scale);
      box(scale);
      translate(0,0,-scale*2);
      box(scale);
      translate(0,-scale,scale);
      box(scale);
          
      translate(0, scale * 5);
    
  }
}

//This code was inspire of the ServetGulnaroglu video 
//https://www.youtube.com/watch?v=CJF4ZNJYoSY&t=328s&ab_channel=ServetGulnaroglu
