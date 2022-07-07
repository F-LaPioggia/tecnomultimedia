boolean sobreBoton(int px, int py, int ancho, int alto) {

  boolean estoySobre = mouseX>px && mouseX <px+ancho && mouseY >py && mouseY <py+alto;
  return estoySobre;
}

void boton (int pxb, int pyb, int ancho, int alto, int redondeado) {
  rectMode(CENTER);
  rect (pxb, pyb, ancho, alto, redondeado);
}
