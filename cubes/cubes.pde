int cols; //Columnas
int rows; //Filas
int deep; //Profundidad

int scale = 20;

int w = 800; //Ancho
int h = 800; //Alto
int d = 800; 

float f = 0;
float xoff = 0;

float[][] alturas;
int[][] trees;
int [] s1,s2;


int contador = 0;

tree t1;

void setup(){
  
  cols = w / scale;
  rows = h / scale;
  deep = d / scale;
  
  trees = new int[cols][rows];
  alturas = new float[cols][rows];
  
  s1 = new int[rows];
  s2 = new int[rows];
  
  size(800,800,P3D);
  
}

void draw(){
  f += 0.01;
  float yoff = f;
  
  for(int x = 0; x < rows;x++){
    float xoff = 0;
    for(int y = 0; y < cols; y++){
      alturas[x][y] = int(map(noise(xoff,yoff), 0,1,0,30));
      xoff += 0.03;
    }
    yoff += 0.03;
  }
  


  background(0);
  //noFill();
  //fill(0,0,255);
  stroke(255);
  
  translate(width/2, rows/2*scale + height/2);
  rotateY(PI/4);
  rotateX(-0.2);
  rotateZ(-0.2);
  //translate(-w/2,-h/2);
  //t1 = new tree(scale);
  

  for(int z = 0; z < deep;z++){
  
    if(z == 0 && contador%3 == 0){
      contador =0;
      for(int y = 0; y < rows; y++){
        
        trees[y][rows-1] = int(random(0,200));
      
      } 
      
      println("Primero" + trees[z][cols-1]);

      
      for(int x = 0; x <cols-1; x++){   //Hacer que ordene el array hacia la otra direccion
        for(int y = 0; y < rows; y++){
          trees[y][x] = trees[y][x+1]; 
          }  
      }

      
      println("Segundo" + trees[z][cols-1]);
    }
    contador++;
    //println(contador);
    
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
         
          water(y,x,z);
          
          if(y == alturas[z][x]-1 && y > 10 && trees[x][z] == 1){
              tree(y,x,z);
          }
      }
      translate(scale,(scale*alturas[z][x]));
    }
    translate(-(scale*cols),0,-scale);
    
  }
  
}

void water(int y,int x,int z){

  if(y == alturas[z][x]-1 && alturas[z][x]-1 < 10){
    fill(0,0,255);
    for(int a = y; a < 10; a++){
      box(scale);
      translate(0,-scale);
    }          
    translate(0,scale * (10-y)); 
  }
  
}

void tree(int y,int x, int z){
  
  if(y == alturas[z][x]-1 && y > 10){
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
