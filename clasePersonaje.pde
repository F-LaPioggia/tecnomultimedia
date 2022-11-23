class Personaje {

  int ux, uy, tamaX, ubic;
  PImage [] movI;
  PImage [] movD;
  PImage vidas, pizza, pizza1;
  int mover, vida;
  boolean direccion, puedeCaer;

  Personaje () {

    vidas = loadImage ("vida.png");
    pizza = loadImage ("pizza1.png");
    pizza1 = loadImage ("pizza1.png");
    movI = new PImage [7];
    movD = new PImage [7];

    vida = 3;
    for (int i = 0; i<7; i ++) {

      movI [i] = loadImage ("personajeInv" +i+ ".png");
      movD [i] = loadImage ("personaje"+i+".png");
    }

    ux = width/2;
    uy = 0;
    tamaX =50;  
    direccion = true;
    puedeCaer = true;
  }

  void dibujarPersonaje() {

    if (direccion) { 
      image (movI[mover], ux, uy);
    } else {   
      image (movD[mover], ux, uy);
    }
  }

  void mover() { 
    uy += 7;
    uy = uy>height? 0: uy;
  }

  void rebote() { 
    uy -= 7;
  }


  void moverPersonaje(int tecla) {

    if (frameCount%4== 0) { //velocidad de mov.
      if (tecla == LEFT ) {
        ux -=10;
        direccion = true;
      }
      if (tecla == RIGHT) {
        ux +=10;
        direccion = false;
      }

      mover ++;
      mover = mover%7;

      if (ux < -50) {
        ux = width+10;
      }
      if (ux> width+10) {
        ux = -50;
      }
    }
  }

  void vidas (int px, int py) {
    image (vidas, px, py);
  }
  void pizza (int px, int py) {
    image (pizza, px, py);
  }
}
