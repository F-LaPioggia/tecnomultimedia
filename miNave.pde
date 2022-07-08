void miNave() {
  fill (255);

  textFont (texto, 15);
  text ("VIDAS:"+vidas, 50, 50);
  text ("PUNTOS:"+puntos, width/2, 50);
  text ("/250", width/2+75, 50);
  fill (0, 255, 255);
  rect (px, pInicialY, 30, 3, 20);
  image (miNave, 100, py);
  noFill();
  rect (100, py, 50, 50);

  if (keyCode == UP && py>25) {
    py -=2;
    by -=2;
  }
  if (keyCode == DOWN && py<height-25) {
    py +=2;
    by +=2;
  }

  if (frameCount%10 ==0) {
    px++;
    disparo = true;
    
  }
  if (disparo && px>100) {
    px +=5;
    
  } else {
    px = 100;
    pInicialY = py;
    disparos.play();
  }
}
