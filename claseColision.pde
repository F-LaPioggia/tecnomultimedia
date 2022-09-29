class Colision {
  
  int px,py,tamX,tamY;
  boolean seTocan;
  Colision (int px, int py, int tamX, int tamY){
    this.px = px;
    this.py = py;
    this.tamX = tamX;
    this.tamY = tamY;
  
  }
  void dibujarColision(int px, int py, int tamX, int tamY){
    noFill();
    noStroke();
    rect (px,py,tamX,tamY);   
  }
  
  void seToca (){
    seTocan = true;
  }
    
    
    
  }
