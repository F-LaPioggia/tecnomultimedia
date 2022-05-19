PImage nube1, nube2, logo, carl, soga, casa, russel, dug, kevin,michael,docter, reiniciar,personajes;
PFont fuente;
float px,py,px2, posy, pxb, pyb,  ancho,  alto;
int miPantalla;


void setup() {
  size (400, 600);
  //---------------------IMAGENES---------
  nube1 = loadImage ("nube1.png");
  nube2 = loadImage ("nube2.png");
  logo = loadImage ("logo.png");
  carl = loadImage ("carl.png");
  soga = loadImage ("soga.png");
  casa = loadImage ("casaa.png");
  russel = loadImage ("russel.png");
  dug = loadImage ("dug.png");
  kevin = loadImage ("kevin1.png");
  michael = loadImage ("michael.png");
  docter = loadImage ("docter.png");
  reiniciar = loadImage ("reiniciar.png");
  personajes = loadImage ("russelYcarl.png");
  
  //-------------------------FUENTE----------
  fuente = createFont ("Where is my Frog.ttf", 40);
  textFont (fuente);
  textAlign(CENTER);
  
  //-------------------------VALORES----------
  posy = height-100;
  //py = height-200;
  
  px = random(0, width-170);
  py = random (0, height-100);
  px2 = random(150, width-170);


  
}

void draw() {
  //-----------------------FONDO-----------------
  background (0, 220, 215);
  

  miPantalla = frameCount;
  println (miPantalla);

  nubes ();  
  /*if (miPantalla %6 == 0) {
   py += 30;
   }                        INTENTO FALLIDO MOVIMIENTO
   if (py> height-140) {               :(
   py = 0;
   }*/

  pantallas();
  
  tint (255);
  println (unBoton (width-50,10,50,40));
  image (reiniciar, width-50,10,55,40);
  
  

}


//----------------------Reinicio programa-----------
void mousePressed(){
  if (unBoton (width-50,10,50,40)){
    frameCount = 0;
    posy = height-100;
    px = random(0, width-170);
    py = random (0, height-100);
    px2 = random(150, width-170);
    
    
  }
}
  
void boton () {
  
  image (reiniciar, pxb, pyb, ancho, alto);
}


boolean unBoton(int px, int py, int ancho, int alto) {
  boolean estaEn = mouseX>px && mouseX <px+ancho && mouseY >py && mouseY <py+alto;
  return estaEn;
}
