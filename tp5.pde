// Alumno: La Pioggia, Franco.
// Legajo: 88206/0
// Comisión: 1
// tp 5
// Url al video:  

Master m;
void setup (){
  size (650,550);
  m = new Master ();

}

void draw (){
  m.dibujarMaster();
  //m.caer();
  
 if (keyPressed) {
    m.movimiento ();
  }
  
}

void mousePressed(){
 m.accionarBotones();

}
