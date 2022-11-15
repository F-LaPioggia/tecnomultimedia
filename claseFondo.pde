class Fondo {
  PImage fondo;
  int x, y, tam;

  Fondo (int x, int y) {
    this.x = x;
    this.y = y;
    tam = 600;
    fondo = loadImage ("fondo.jpg");
    textAlign(CENTER);
      textSize (20);

    }
  

  void dibujarFondo() {
    image (fondo, 0, 0);
  }
  
  
  
}
