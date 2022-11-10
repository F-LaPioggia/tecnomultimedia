class Enemigo extends Movimiento{
  PImage [] enemigo;
  float tam;
  Enemigo (float px, float py, float direc){
    super (px,py,direc);
    enemigo = new PImage [3];
    tam=50;
    for (int i =0; i<3; i++){
    enemigo [i] = loadImage ("enemigo.png");
    }
  }
  
  void dibujarEnemigo(){
    image  (enemigo[0], px, py,tam,tam); //primer enemigo
    image  (enemigo[1], px, py+320,tam,tam); // 2do enemigo 
    // preguntar cómo darle diferentes direcciones
    desplazamiento();
  }
}
