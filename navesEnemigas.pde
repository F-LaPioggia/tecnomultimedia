void enemigo() {

  for (int i=0; i<cant; i++) {
    fill (255, 0, 0);
    rect (dx[i], ubicY[i], tam[i]/2, tam[i]/8, 30);
    //float ux, float uy, float tam
    enemigos (ubicX[i], ubicY[i], tam[i]);

    if (ubicY[i] >= height|| ubicY[i]<=0 ) {
      direc[i] *= -1;
      tam [i] = random (30, 60);
      seDisparo[i] = false;
    }

    ubicY [i] += direc [i];
    vel [i] += direc [i];

    if (contacto (px, py, ubicX[i], ubicY[i], tam[i])) {
      disparo = false;
      ubicY[i] = height-50;//vuelve a aparecer
      puntos += 25;
    }
    if (px > width) {
      disparo = false;
    }
    if (contacto (dx[i], ubicY[i], 100, py, 50)) {
      seDisparo[i] = false;
      vidas --; //vuelve a aparecer
    }
    if (contacto (dx[i], ubicY[i], px, by, 30)) {
      disparo = true;

      ; //vuelve a aparecer
    }
    if (contacto (px, by, dx[i], ubicY[i], tam[i])) {
      seDisparo[i] = true;
      ; //vuelve a aparecer
    }

    if (vidas == 0) {
      estado = "perdiste";
    }
    if (puntos == 250) {
      estado ="ganaste";
    }


    if (frameCount%10==0) {
      dx[0]-=5;
      dx[3]-=2;
      seDisparo[i] = true;
      
    }
    if (frameCount%60==0) {
      dx[1]-=6;
      seDisparo[i] = true;
      disparos.play();
    }
    if (frameCount%80==0) {
      dx[2]-=8; 
      seDisparo[i] = true;
      disparos.play();
    }



    if (seDisparo[i] && dx[i]<width-70) {
      dx [i] -=5;
      
    } else {
      dx[i] = width-70;
      
    }
  }
}


void enemigos (float ux, float uy, float tam) {

  image (enemigo, ux, uy, tam, tam);
  noFill();
  noStroke();
  ellipse (ux, uy, tam, tam);
}
