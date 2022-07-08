// Franco La Pioggia
// Comisión 1
// Legajo 88206/0
// Tp 3: Videojuego
// URL del video: https://youtu.be/TyY59BDmyEc

import processing.sound.*;
PImage fondo, enemigo, miNave, perdiste;
SoundFile disparos;
PFont titulos, texto;
int cant = 4;
float py = 200;
float px = 100;
float by=  200;
float ty = height-10;
int vidas = 5;
int puntos = 0;
float pInicialY = 100;
float [] dx = new float [cant];
float [] dy = new float [cant];
float [] bEnemigosY = new float [cant];
float [] ubicY = new float [cant];
float [] ubicX = new float [cant];
float [] tam = new float [cant];
float [] vel = new float [cant];
float [] direc = new float [cant];
boolean [] seDisparo = new boolean [cant];
String estado;
int pantallas;
boolean disparo;


void setup () {
  size (600, 400);
  titulos = loadFont ("Impact.vlw");
  texto = loadFont ("Arial.vlw");
  disparos = new SoundFile (this, "laser.wav");
  estado = "Inicio";
  fondo = loadImage ("fondo.jpg");
  miNave = loadImage ("naveMia1.png");
  perdiste = loadImage ("gameover.png");
  disparo = false;
  textSize (15);
  textAlign (CENTER);

  //--------------ENEMIGO--------------------
  imageMode (CENTER);
  rectMode (CORNER);
  enemigo = loadImage ("naveEnemiga.png");
  for (int i=0; i<cant; i++) {
    ubicY[i] = height;
    ubicX[i] = width-70;
    dx[i] = width-70;
    dy[i] = direc [i];
    tam [i] = random (50, 60);
    direc [i] = random (1, 3); 
    vel [i] += direc [i];
    seDisparo [i] = true;
  }
  //--------------ENEMIGO---------------------

}

void draw () {
  background (fondo);
  if (estado == "Inicio") {
    textFont (titulos);
    fill (255);
    textSize (70);
    text ("SPACE\nWAR", width/2, height/4);
    noFill();
    stroke (0, 255, 0);
    strokeWeight(3);
    textSize (32);
    boton (width/2, height-150, 400, 60, 20);
    fill (0, 255, 0);
    text ("JUGAR", width/2, height-140);
    noFill();
    boton (width/2, height-80, 300, 60, 20);
    fill (0, 255, 0);
    text ("Instrucciones", width/2, height-70);
  } else if (estado == "Jugando") {
    enemigo();
    miNave();
  } else if (estado == "perdiste") {
    textFont (titulos);
    textSize (32);
    noFill ();
    image (perdiste, width/2, height/2);
    boton (width/4, height-150, 200, 60, 20); 
    stroke (0, 255, 0);
    boton (450, height-150, 200, 60, 20);
    noFill ();
    stroke (0, 255, 0);
    fill(0, 255, 0);
    text ("REINICIAR", width/4, height-140);
    text ("INICIO", 450, height-140);
  } else if (estado == "ganaste") {
    textFont (titulos);
    fill (255);
    textSize(70);
    text ("GANASTE", width/2, height/2-50);
    noFill();
    textSize(32);
    stroke (0, 255, 0);
    boton (width/4, height-150, 200, 60, 20); 
    boton (450, height-150, 200, 60, 20);
    noFill ();
    fill(0, 255, 0);
    text ("REINICIAR", width/4, height-140);
    text ("INICIO", 450, height-140);
    stroke (255);
    noFill();
    boton (480, 30, 150, 40, 20);
    textSize (20);
    text ("CREDITOS",480, 40);
  } else if (estado == "Instrucciones") {
    fill(255);
    textFont (titulos, 32);
    text("INSTRUCCIONES", width/2, height/6);
    textFont (texto, 15);
    text ("Muevete para arriba y abajo con Arriba y Abajo, frena con 'barra espaciadora'\n¡Y no dejes que te destruyan!", width/2, height/4);
    image (miNave, 200, height/2);
    text ("Tu nave", 200, height-150);
    image (enemigo, 400, height/2);
    text ("Nave enemiga", 400, height-150);
    fill (255, 0, 0);
    noStroke();
    rect (400, height-100, 40, 5, 20);
    fill(255);
    text ("Bala enemiga", 400, height-75);
    fill (0, 255, 255);
    rect (200, height-100, 40, 3, 20);
    fill (255);
    text ("Tu bala", 200, height-75);
    text ("Objetivo: llegar a 250 puntos. Cada nave enemiga suma +25 puntos", width/2, height-25);
    stroke (0, 255, 0);
    noFill();
    boton (50, 50, 50, 30, 10);
    fill (255);
    text ("Volver", 50, 55);
  } else if ( estado == "Creditos"){
    textSize (35);
    text ("Creado por : Franco La Pioggia\n\n¡Gracias!",width/2,ty+200);
    ty --;
    stroke (0, 255, 0);
    noFill();
    boton (50, 50, 50, 30, 10);
    fill (255);
    textSize (15);
    text ("Volver", 50, 55);
  }

  println ("x:"+mouseX);
  println (mouseY);
}

boolean contacto (float miBalax, float miBalay, float ex, float ey, float tam) {
  float distancia = dist (miBalax, miBalay, ex, ey);
  return distancia < tam;
}

void mousePressed () {
  if (sobreBoton (100, 220, 400, 60)) {
    estado = "Jugando";
  }
  if (sobreBoton (51, 222, 200, 60)) {
    estado = "Jugando";
    vidas = 5;
    puntos = 0;
    for (int i=0; i<cant; i++) {
      ubicY[i] = height;
      ubicX[i] = width-70;
      dx[i] = width-70;
      dy[i] = direc [i];
      tam [i] = random (50, 60);
      direc [i] = random (1, 3); 
      vel [i] += direc [i];
      seDisparo [i] = false;
    }
  }
  if (sobreBoton (360, 222, 200, 60)) {
    estado = "Inicio";
    vidas = 5;
    puntos = 0;
    for (int i=0; i<cant; i++) {
      ubicY[i] = height;
      ubicX[i] = width-70;
      dx[i] = width-70;
      dy[i] = direc [i];
      tam [i] = random (50, 60);
      direc [i] = random (1, 3); 
      vel [i] += direc [i];
      seDisparo [i] = false;
    }
  }
  if (sobreBoton (151, 290, 300, 60)) {
    estado = "Instrucciones";
  }
  if (sobreBoton (36, 36, 50, 30)) {
    estado = "Inicio";
     vidas = 5;
    puntos = 0;
  }
  if (sobreBoton (480, 18, 150, 40)) {
    estado = "Creditos";
  }
}
