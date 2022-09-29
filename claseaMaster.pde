class Master {
  Fondo fondo;
  Personaje personaje;
  Colision colision;
  Colision [] colisionForma;
  
  
  Master (){
    fondo = new Fondo(0,0);
    personaje = new Personaje();
   
    colisionForma = new Colision[0];
   
   
  }
  
  void dibujarMaster(){
    fondo.dibujarFondo();
    personaje.dibujarPersonaje();
    
    
  }
  
  void movimiento(){
    personaje.moverPersonaje(keyCode);
   
  }
  
  /*void caer (){
    for (int i = 0; i< colisionForma.length; i++){
      float distan = dist (personaje.ux,personaje.uy,colisionForma[i].px,colisionForma[i].py);
        if (distan < personaje.tamaX+colisionForma[i].tamX){
          colisionForma[i].seToca();
          personaje.uy -=10;
        } 
    }
  }*/
}
