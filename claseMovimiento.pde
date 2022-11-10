class Movimiento{ //superClase
  float px, py;
  float direc;
  Movimiento (float px, float py, float direc){
    this.px = px;
    this.py = py;
    this.direc = direc;
  }
  
  void desplazamiento (){
    if (px > width-50 || px <= 0){
      direc *= -1; 
    } 
    px += direc;
  }
}
