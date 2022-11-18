class Master {
  Fondo fondo;
  Personaje personaje;
  Colision col[] = new Colision [6];
  Pizza p[] = new Pizza [3];
  Enemigo en[] = new Enemigo [2];
  Boton bot1, bot2, bot3, bot4, bot5, bot6, bot7;
  
  
  int cant = 3;
  int cantPizza =0;
  int pantalla;
  String estado;
  int anchoBot, altoBot;
  PImage inicio, perdiste, ganaste, creditos, instrucciones;
  
  
  
  Master () {
    
    
    inicio = loadImage ("inicio.jpg");
    perdiste = loadImage ("perdiste.jpg");
    ganaste = loadImage ("ganaste.jpg");
    creditos = loadImage ("creditos.jpg");
    instrucciones = loadImage ("instrucciones.jpg");
    fondo = new Fondo(0, 0);
    personaje = new Personaje();
    estado = "Inicio";
    
    // Botones
    anchoBot = 300;
    altoBot = 60;
    bot1 = new Boton (width/4, height/2, anchoBot, altoBot);           // Boton Jugar
    bot2 = new Boton (width/4, height-170, anchoBot, altoBot);         // Boton Instrucciones
    bot3 = new Boton (width/7, height/3, anchoBot-100, altoBot);       // Boton Inicio
    bot4 = new Boton (width-320, height/3, anchoBot-100, altoBot);     // Boton Volver a jugar
    bot5 = new Boton (width-400, height-60, anchoBot-150, altoBot-10); // Boton Creditos
    bot6 = new Boton (50, 50, anchoBot/4, altoBot-20);                 // Boton Back
    bot7 = new Boton (width-400, height-60, anchoBot-150, altoBot-10); // Boton Jugar (desde instrucciones)
    
   //Construimos las colisiones de las plataformas
      col[0] = new Colision (235,135,600,30);
      col[1] = new Colision (-50,135,155,30);
      col[2] = new Colision (-50,265,450,30);
      col[3] = new Colision (550,265,150,30);
      col[4] = new Colision (170,405,500,30);
      col[5] = new Colision (-50,540,width+100,30);
      
   //Enemigos
      en[0] = new Enemigo (width/2, 220, 1,0,width-280);
      en[1] = new Enemigo (width/2, 500, -1,0,width-50);
      
    //Pizzas
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
  }


  void dibujarMaster() {
    
    if (pantalla == 0){ // Inicio
      image (inicio,0,0);
      textSize (32);
      bot1.dibujarBoton(0, 1, "JUGAR",32); 
      bot2.dibujarBoton (0,2, "INSTRUCCIONES",32);
      
    }else if (pantalla == 1){ // Jugando
      
    fondo.dibujarFondo();
    personaje.dibujarPersonaje(); //metodo para dibujar al personaje
    personaje.mover();            //metodo para mover el personaje
    personaje.vidas(20,20); //corazon imagen
    personaje.pizza(width-50,15); //pizza imagen
    
    
    fill(0);
     textSize (20);
     text (""+cant,50,25);
     text (""+cantPizza,width-60,25);
     
    for ( int i = 0; i<en.length; i++){
      en[i].dibujarEnemigo();
      if (contacto (personaje.ux, personaje.uy, personaje.tamaX, en[i].px, en[i].py, en[i].tam, en[i].tam)){
       personaje.ux = width/2;
       personaje.uy = 0;
       cant --;
       golpe.play();
      }
      
    }
    
    for ( int i = 0; i<p.length; i++){
      p[i].dibujarPizza();
      if (contacto (personaje.ux, personaje.uy, personaje.tamaX, p[i].px, p[i].py, p[i].tam, p[i].tam)){
       p[i].px = 1000;
       p[i].py = 1000;
       cantPizza ++;
       comiendo.play();
      }
      
    }

      //dibujamos las plataformas donde colisionará  
    for (int i = 0; i<col.length; i++){
        fill(0);
      col[i].dibujarColision();
      
       if (contacto (personaje.ux, personaje.uy, personaje.tamaX, col[i].px, col[i].py, col[i].tamX, col[i].tamY)) {
          personaje.rebote();
}
    }
    
    }else if (pantalla == 2){ // perdiste
      image (perdiste,0,0);
      bot3.dibujarBoton(2, 0, "INICIO",20);
      bot4.dibujarBoton(2,1, "JUGAR DE NUEVO",20);
      
    }else if (pantalla == 3){ // ganaste
      image (ganaste, 0,0);
      bot3.dibujarBoton(3, 0, "INICIO",20);
      bot4.dibujarBoton(3,1, "JUGAR DE NUEVO",20);
      bot5.dibujarBoton(3,5, "CRÉDITOS",20);
    
    }else if (pantalla == 4){  //Instrucciones
      image (instrucciones, 0, 0);
      bot6.dibujarBoton (4,0, "VOLVER",15);
      bot7.dibujarBoton (4, 1, "JUGAR",32);
      
    }else if (pantalla == 5){  //Créditos
      image (creditos, 0, 0);
      bot6.dibujarBoton (5,0, "VOLVER",15);
    }
    
      //armamos los colisionadores limitando la caída del personaje

     
     if (cant == 0){
       pantalla = 2; // Perdiste
       
     }
     
     if (cantPizza == 3){
       pantalla = 3;
     }
  }

  void movimiento() {
    personaje.moverPersonaje(keyCode);
  }


  boolean contacto(int px, int py, int tam, int x, int y, int ancho, int alto ) { 
      return px + tam > x && px<x+ancho && py+tam*2>y && py<y+alto;     
  }
  

  
  
  void accionarBotones() {
    
    // indicamos el paso de pantallas y re asignamos valores a 0 para poder volver a jugar
    
    if (bot1.botonPress(width/4, height/2, anchoBot, altoBot) && pantalla == bot1.actual) {
      pantalla = 1;
      cant = 3;
      cantPizza = 0;
      personaje.ux = width/2;
      personaje.uy = 0;
    }
    if (pantalla == 0){ //hacemos esto para que el botón de instrucciones no se pueda activas mientras estás jugando
    if (bot2.botonPress(width/4, height-170, anchoBot, altoBot) && pantalla == bot2.actual) {
      pantalla = 4;
    }
    }
    if (pantalla == 2){  // Pantalla de perdiste
    if (bot3.botonPress(width/7, height/3, anchoBot-100, altoBot) && pantalla == bot3.actual) {
      pantalla = 0;
      cant = 3;
      cantPizza = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
    }
    if (bot4.botonPress(width/2, height/3, anchoBot-100, altoBot) && pantalla == bot4.actual) {
      pantalla = 1;
      cant = 3;
      cantPizza = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
    }
    }
    if (pantalla == 3){ // pantalla de ganaste
    if (bot3.botonPress(width/7, height/3, anchoBot-100, altoBot) && pantalla == bot3.actual) {
      pantalla = 0;
      cant = 3;
      cantPizza = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
    }
    
    if (bot4.botonPress(width/2, height/3, anchoBot-100, altoBot) && pantalla == bot4.actual) {
      pantalla = 1;
      cant = 3;
      cantPizza = 0;
      personaje.ux = width/2;
      personaje.uy = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
    }
    
    if (bot5.botonPress (width-400, height-60, anchoBot-150, altoBot-10)&& pantalla == bot4.actual) {
      pantalla = 5;
      cant = 3;
      cantPizza = 0;
      personaje.ux = width/2;
      personaje.uy = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
    }
    }
    if (pantalla == 4){ // pantalla de instrucciones
      cant = 3;
      cantPizza = 0;
      personaje.ux = width/2;
      personaje.uy = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
      
      if (bot6.botonPress(50, 50, anchoBot/4, altoBot-20) && pantalla == bot6.actual) {
      pantalla = 0;
    }
      
      if (bot7.botonPress(width-400, height-60, anchoBot-150, altoBot-10) && pantalla == bot7.actual) {
      pantalla = 1;
      
    }
    
  }
    if (pantalla == 5){ // pantalla de créditos
    if (bot6.botonPress(50, 50, anchoBot/4, altoBot-20) && pantalla == bot6.actual) {
      pantalla = 0;
      cant = 3;
      cantPizza = 0;
      p[0] = new Pizza (70,70,40);
      p[1] = new Pizza (width/2,200,40);
      p[2] = new Pizza (width-200,470,40);
    }
  }
  }
 }
