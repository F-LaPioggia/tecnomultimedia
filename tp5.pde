
// Alumno: La Pioggia, Franco.
// Legajo: 88206/0
// Comisión: 1
// tp 5
// Url al video:  

import processing.sound.*;

SoundFile fondo, golpe, comiendo;

Master m;
void setup (){
  size (650,550);
  m = new Master ();
  fondo =    new SoundFile  (this, "fondo.wav");
  golpe =    new SoundFile  (this, "golpe.wav");
  comiendo = new SoundFile  (this, "comiendo.wav");
  fondo.amp(0.2);
  fondo.loop();
}

void draw (){
  m.dibujarMaster(); 
 if (keyPressed) {
    m.movimiento ();
  }
  
}

void mousePressed(){
 m.accionarBotones();

}
