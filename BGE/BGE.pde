import java.awt.event.KeyEvent;

int ancho,largo; //Ventana

int cx, cy; //Centro

int r; //Cirlce radio

int z; //Tile altura
float angle; //Tile angulo
float initAngle; // Valor inicial de angulo
int initZ; //Valor inicial de Z
int tileNum; //Numero de Tiles

tile[] Tiles;
String chars = "";

PFont fuenteBGE;

float cAngle;
int cSelect;

String imputText = "";

void setup(){

  size(1280,720,P3D);
  
  ancho = 1280;
  largo = 720;
    
  cx = ancho/2;
  cy = largo/2;
  
  r = 500;
  
  initZ = 300;
  
  initAngle = 230;
  
  cAngle = 55; 
  cSelect = 19;
  
  tileNum = 36; //36 Circulo entero
  
  Tiles = new tile[tileNum];
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"; //36 chars
  
  fuenteBGE = createFont("DesdemonaBlackRegular.otf", 40);

}

void draw(){
    
  background(0);
  
    
  //strokeWeight(10);
  //stroke(255,0,0);
  //point(cx,cy);
  
  stroke(255);
  strokeWeight(5);
  noFill();
  circle(cx,cy,500);
  
  //---------------------------------------Tile Generation----------------------------------------------
  z=initZ;
  angle=initAngle;

    
  for(int i = 0;i < tileNum; i++){
    
    Tiles[i] = new tile(z,angle,r,Character.toString(chars.charAt( i )),fuenteBGE, initAngle);
    Tiles[i].show();
    angle -= 15;
    z -= 15;

  }
  
  cursor();
  
  //---------------------------------------Center Text----------------------------------------------
  
  fill(255,255,255);
  textSize(40);
  textFont(fuenteBGE);
  text(imputText,cx-((20*imputText.length()/2)),cy);



}

void keyPressed(){

  switch (keyCode) {
    case KeyEvent.VK_RIGHT: 
      println("RIGHT:" + keyCode); 
      if(cSelect > 0){
        initZ -= 15;
        cAngle -= 15;
        cSelect--;
      }
      break;
    case KeyEvent.VK_LEFT: 
      println("LEFT:" + keyCode);
      if(cSelect < 35){
        initZ += 15;
        cAngle += 15;
        cSelect++;
      }
      break;
    case KeyEvent.VK_ENTER: 
      println("ENTER:" + keyCode);
      imputText = imputText + Character.toString(chars.charAt(cSelect));
      println(Character.toString(chars.charAt(cSelect)));
      break;

  }

}

void cursor(){
  
  int pX = int(cx + (((r/2) - 50) * cos((cAngle * (PI/180)) *-1 ))); 
  int pY = int(cy + (((r/2) - 50) * sin((cAngle * (PI/180)) *-1 ))); 
  
  int pX1 = int(cx + (((r/2) - 120) * cos(((cAngle-10) * (PI/180)) *-1 )));
  int pY1 = int(cy + (((r/2) - 120) * sin(((cAngle-10) * (PI/180)) *-1 ))); 
  
  int pX2 = int(cx + (((r/2) - 120) * cos(((cAngle+10) * (PI/180)) *-1 ))); 
  int pY2 = int(cy + (((r/2) - 120) * sin(((cAngle+10) * (PI/180)) *-1 ))); 
  
  fill(157,159,200);
  stroke(157,159,200);
  
  beginShape(TRIANGLES);
    vertex(pX, pY);
    vertex(pX1,pY1);
    vertex(pX2,pY2);
  endShape();

}
