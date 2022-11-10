// Alumno: La Pioggia, Franco.
// Legajo: 88206/0
// Comisión: 1
// tp 4
// Url al video:  https://youtu.be/5JIZ7Sq8ag8
Master m;
void setup (){
  size (600,650);
  m = new Master ();

}

void draw (){
  m.dibujarMaster();
  //m.caer();
  
 if (keyPressed) {
    m.movimiento ();
  }
  
}
