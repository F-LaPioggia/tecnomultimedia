class Master {
  Fondo fondo;
  Personaje personaje;
  Colision [] colisionForma = new Colision[4];
  Enemigo enemigo;


  Master () {
    fondo = new Fondo(0, 0);
    personaje = new Personaje();
    enemigo = new Enemigo(width/2, 280, random (-2, 2));
    
    colisionForma [0]= new Colision(0, 135, width, 30);  //Primer plataforma
    colisionForma [1]= new Colision(0, 320, width, 30);//2da plataforma
    colisionForma [2]= new Colision(0, 490, width, 30);  //3era plataforma
    colisionForma [3]= new Colision(0, 630, width, 30);  //4ta plataforma
  }

  void dibujarMaster() {
    fondo.dibujarFondo();
    personaje.dibujarPersonaje();
    enemigo.dibujarEnemigo();
    noFill();
    for (int i =0; i<colisionForma.length; i++) {
      fill (0);
      colisionForma[i].dibujarColision();
      //armamos los colisionadores para que el jugador no pueda subir y bajar por donde quiera
      if (contacto (personaje.ux, personaje.uy, personaje.tamaX, colisionForma[i].px, colisionForma[i].py, colisionForma[i].tamX, colisionForma[i].tamY)) {
        if (personaje.uy+personaje.tamaX/2>colisionForma[i].py && personaje.uy<colisionForma[i].py+colisionForma[i].tamY) {
          personaje.reboteArriba();   
        }
        if (personaje.uy<colisionForma[i].py + colisionForma[i].tamY && personaje.uy>colisionForma[i].tamY) {
          personaje.reboteAbajo();
        }
        
      }
    }
  }

  void movimiento() {
    personaje.moverPersonaje(keyCode);
  }




  boolean contacto(int px, int py, int tam, float x, float y, float ancho, float alto ) {
    if (px+tam>x && px <x+ancho && py+tam*2>y && py<y+alto) {
      return true;
    } else {
      return false;
    }
  }
}
