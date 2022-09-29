class Fondo {
  Colision [] colisionForma;
  PImage fondo;
  int x, y, tam;

  Fondo (int x, int y) {
    this.x = x;
    this.y = y;
    tam = 400;
    fondo = loadImage ("fondo.jpg");
  
    colisionForma = new Colision[4];
    for (int i=0; i<4; i++) {
      colisionForma [i] = new Colision(0, 0, tam, 0);
      textAlign(CENTER);
      textSize (20);
     
    }
  }

  void dibujarFondo() {
    image (fondo, 0, 0);
    colisionForma [0].dibujarColision(0, 130, tam, 30);  //Primer plataforma
    colisionForma [1].dibujarColision(135, 299, tam+70, 30);//2da plataforma
    colisionForma [2].dibujarColision(0, 472, tam, 30);  //3era plataforma
    colisionForma [3].dibujarColision(0, 675, tam+200, 30);  //4ta plataforma
    fill (0);
    text ("DESPLAZATE CON LAS FLECHITAS ▲ ▼ ► ◄",width/2,50);
  }
}
