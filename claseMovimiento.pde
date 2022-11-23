class Movimiento { //superClase
  int px, py;
  int direc;
  Movimiento (int px, int py, int direc) {
    this.px = px;
    this.py = py;
    this.direc = direc;
  }

  void desplazamiento (int minim, int max) {
    if (px > max || px <= minim) {
      direc *= -1;
    } 
    px += direc;
  }
}
