class Colision {
  
  int px,py,tamX,tamY;
  Colision (int px, int py, int tamX, int tamY){
    this.px = px;
    this.py = py;
    this.tamX = tamX;
    this.tamY = tamY;
  
  }
  void dibujarColision(){
    //noFill();
    noStroke();
    rect (px,py,tamX,tamY);   
  }
  
 
  }
