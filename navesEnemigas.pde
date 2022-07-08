void enemigo() {

  for (int i=0; i<cant; i++) {
    fill (255, 0, 0);
    rect (dx[i], bEnemigosY[i], tam[i]/2, tam[i]/8, 30);
    //float ux, float uy, float tam
    enemigos (ubicX[i], ubicY[i], tam[i]);

    if (ubicY[i] >= height|| ubicY[i]<=0 ) {
      direc[i] *= -1;
      tam [i] = random (30, 60);
      seDisparo[i] = false;
      
    }

    ubicY [i] += direc [i];

    if (contacto (px, pInicialY, ubicX[i], ubicY[i], tam[i])) {
      disparo = false;
      ubicY[i] = random (0,height);//vuelve a aparecer
      puntos += 25;
      seDisparo[i] = false;
    }
    if (px > width) {
      disparo = false;
    }
    if (contacto (dx[i], bEnemigosY[i], 100, py, 50)) {
      seDisparo[i] = false;
      vidas --; 
    }
    if (contacto (dx[i], bEnemigosY[i], px, pInicialY, 30)) {
      disparo = true;

      ; //vuelve a aparecer
    }
    if (contacto (px, pInicialY, dx[i], ubicY[i], tam[i])) {
      seDisparo[i] = true;
      ; //vuelve a aparecer
    }

    if (vidas == 0) {
      estado = "perdiste";
    }
    if (puntos == 250) {
      estado ="ganaste";
    }


    if (frameCount %30 == 0) {
      dx[0]-=2;
      seDisparo[i] = true;
      
    }
    if (frameCount%40==0) {
      dx[1]-=5;
      seDisparo[i] = true;
      disparos.play();
    }
    if (frameCount%45==0) {
      dx[2]-=8; 
      seDisparo[i] = true;
    disparos.play();
    }
    if (frameCount%50==0) {
      dx[3]-=10;
      seDisparo[i] = true;
      
    }

    if (seDisparo[i] && dx[i]<width-70) {
      dx [i] -=5;
      
    } else {
      dx[i] = width-70;
      bEnemigosY[i]= ubicY[i];
    }
  }
}


void enemigos (float ux, float uy, float tam) {

  image (enemigo, ux, uy, tam, tam);
  noFill();
  noStroke();
  ellipse (ux, uy, tam, tam);
}
