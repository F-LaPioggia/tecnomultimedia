class Pizza {

  PImage p;
  int px, py, tam;
  Pizza (int px, int py, int tam) {

    p = loadImage ("pizza.png");
    this.px = px;
    this.py = py;
    this.tam = tam;
  }

  void dibujarPizza () {
    image (p, px, py, tam, tam);
  }
}
