class tree{

  int scale;
  int x;
  
  tree(int scale){
  
    this.scale = scale;
    this.x = x;
  }
 
  void show(){
  
      fill(156,76,0);
      for(int a = 0; a < 4; a++){
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
  
  void shift(){
    
    scale = scale * x; 
  
  }


}
