class Enemigo extends Movimiento {
  PImage  enemigo;
  int tam, inicia, termina;

  Enemigo (int px, int py, int direc, int minim, int max) {
    super (px, py, direc);
    enemigo = loadImage ("enemigo.png");
    tam=50;
    inicia = minim;
    termina = max;
  }

  void dibujarEnemigo() {
    image  (enemigo, px, py, tam, tam); 
    desplazamiento(inicia, termina);
  }
}
