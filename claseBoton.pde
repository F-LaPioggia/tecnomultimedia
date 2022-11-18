class Boton {
  int bx, by, ancho, alto,tam; //ubicacion y tamaño
  int actual, prox; // en que ventana estoy - a donde voy a ir
  String texto;

  Boton(int bx, int by, int ancho, int alto) {
    this.bx = bx;
    this.by = by;
    this.ancho = ancho;
    this.alto = alto;
    textAlign (CENTER, CENTER);
    //textSize (alto/2);
  }

  void dibujarBoton(int actual, int prox, String texto, int tam) {
    this.actual = actual;
    this.prox = prox;
    this.texto = texto;
    this.tam= tam;
    
    fill (255,0,255,90);
    stroke (255,0,255);
    strokeWeight(3);
    rect (bx, by, ancho, alto,30);
    fill (255);
    textSize (tam);
    text (texto, bx+ancho/2, by+alto/2);
  }

  boolean botonPress (int bx, int by, int ancho, int alto) {
    return mouseX>bx && mouseX < bx+ancho && mouseY> by && mouseY<by+alto;
  }
}
