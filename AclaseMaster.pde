class Master {
  Fondo fondo;
  Personaje personaje;
  //Colision c1,c2,c3,c4,c5,c6;
  Colision col[] = new Colision [6];
  Enemigo enemigo,enemigo1;
  int cant = 3;
  
  Master () {
    fondo = new Fondo(0, 0);
    personaje = new Personaje();
    enemigo = new Enemigo(width/2, 220, 1,0,width/2);
    enemigo1 = new Enemigo(width/2, 500, -1,0,width-50);
    
    //Construimos las colisiones de las plataformas
    
    
      col[0] = new Colision (235,135,600,30);
      col[1] = new Colision (-50,135,155,30);
      col[2] = new Colision (-50,265,450,30);
      col[3] = new Colision (550,265,150,30);
      col[4] = new Colision (170,405,500,30);
      col[5] = new Colision (-50,540,width+100,30);
    
   /* c1 = new Colision (235,135,600,30);
    c2 = new Colision (-50,135,155,30);
    c3 = new Colision (-50,265,450,30);
    c4 = new Colision (550,265,150,30);
    c5 = new Colision (170,405,500,30);
    c6 = new Colision (-50,540,width+100,30);
   */
  }

  void dibujarMaster() {
    fondo.dibujarFondo();
    personaje.dibujarPersonaje();
    personaje.mover();
    personaje.vidas(20,20); // VIDAS: como eliminar cada imagen (preguntar)
    personaje.pizza(width-50,15);
    enemigo.dibujarEnemigo();
    enemigo1.dibujarEnemigo();

      //dibujamos las plataformas donde colisionará
    noFill();
    for (int i = 0; i<col.length; i++){
        fill(0);
      col[i].dibujarColision();
      
       if (contacto (personaje.ux, personaje.uy, personaje.tamaX, col[i].px, col[i].py, col[i].tamX, col[i].tamY)){
         
          personaje.puedeCaer = false;   
          
        }else {
          personaje.puedeCaer = true;   
    }
    }
    /*c1.dibujarColision();
    c2.dibujarColision();
    c3.dibujarColision();
    c4.dibujarColision();
    c5.dibujarColision();
    c6.dibujarColision();*/
    
      //armamos los colisionadores limitando la caída del personaje
      
     
      
  //1er plataforma
      /*|| contacto (personaje.ux, personaje.uy, personaje.tamaX, c2.px, c2.py, c2.tamX, c2.tamY)     // 1er plataforma
      || contacto (personaje.ux, personaje.uy, personaje.tamaX, c3.px, c3.py, c3.tamX, c3.tamY)     // 2da plataforma
      || contacto (personaje.ux, personaje.uy, personaje.tamaX, c4.px, c4.py, c4.tamX, c4.tamY)     // 2da plataforma
      || contacto (personaje.ux, personaje.uy, personaje.tamaX, c5.px, c5.py, c5.tamX, c5.tamY)     // 3er plataforma
      || contacto (personaje.ux, personaje.uy, personaje.tamaX, c6.px, c6.py, c6.tamX, c6.tamY)) {*/  //4ta plataforma
       
        
     if (contacto (personaje.ux, personaje.uy, personaje.tamaX, enemigo.px, enemigo.py, enemigo.tam, enemigo.tam) // Contacto con el enemigo
     || contacto (personaje.ux, personaje.uy, personaje.tamaX, enemigo1.px, enemigo1.py, enemigo1.tam, enemigo1.tam)){
       personaje.ux = width/2;
       personaje.uy = 0;
       cant --;
     }
     fill(0);
     text (""+cant,50,35);
     
     if (cant == 0){
       println("perdiste");
       
     }
  }


  void movimiento() {
    personaje.moverPersonaje(keyCode);
  }

  boolean contacto(int px, int py, int tam, int x, int y, int ancho, int alto ) { 
      return px + tam > x && px<x+ancho && py+tam*2>y && py<y+alto;     
  }
 }
