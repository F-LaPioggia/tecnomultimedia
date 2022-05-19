 void pantallas(){
  
  //-----------------------1ER PANTALLA------------
  //------Logo
  if (miPantalla > 20) {
    float opaco = map (miPantalla, 60, 200, 0, 255);
    tint (255, opaco);
    image (logo, 40, posy, 300, 300);
  }
  posy -=1.5;

  //-----------------------2DA PANTALLA------------
  //-----Texto Carl
  if (miPantalla > 754 && miPantalla < 1200) { 
    float opaco = map (miPantalla, 750, 850, 0, 255);
    fill (0, opaco);
    textSize(30);
    text ("CARL FREDICKSEN\n'Ed Asner/Jeremy Leary'", width/2, height/2);
  }
  //-----Carl
  if (miPantalla > 100) {
    image (soga, 0, posy+200);
    fill (20);
    text ("PROTAGONISTAS", width/2, posy+510);
    image (carl, 0, posy+510);
  }

  //-----------------------3ER PANTALLA------------
  //------ Texto Russell
  if (miPantalla > 1575) { 

    float opaco = map (miPantalla, 1575, 2050, 255, 0);
    fill (0, opaco);
    textSize(30);
    text ("RUSSEL\n'Jordan Nagai'", width/2, height/2);
    
  }
  //------ Russell y casa
  if (miPantalla > 800) {
    image (russel, 0, posy+1800);
    image (casa, -50, posy+1300, 500, 680);
    
  }

  //-----------------------4TA PANTALLA------------
  //------ Dug y Kevin
  if (miPantalla >1900) {
    float opaco = map (miPantalla, 2000, 2080, 0, 255);
    image (dug, -40, posy+2900, 200, 300);
    tint (255, opaco);
    image (kevin, 0, 10);
  }

  if (miPantalla > 2100) {
    float opaco2 = map (miPantalla, 2100, 2500, 255, 0);
    fill (0, opaco2);
    textSize(30);
    text ("Dug y Kevin\n'Bob Peterson/Kevin'", width/2, height/2);
  }
//--------------------5TA PANTALLA
  if (miPantalla > 2200) {
    float rectFondo = map (miPantalla, 2200, 2400, 0, 255);
    fill (0, 150, 255, rectFondo);
    noStroke();
    rect(0, 0, width, height);
    
  }

  if (miPantalla > 2400) {
  float opaco = map(miPantalla, 2400,2850, 255, 0);
    fill(255,opaco);
    textSize(60);
    text ("MÚSICA", width/2, height/4);
    // Preg. CÓMO LO DETENGO EN DETERMINADO LUGAR
    //image (personajes,px,height-100);
  } 
   if (miPantalla >2400) {
    float opaco = map (miPantalla, 2400, 2850, 255, 0);
    tint (255, opaco);
    image (personajes,px,height-100);  
  } 
 
  if (miPantalla > 2400){
  float opaco2 = map (miPantalla, 2400, 2850, 255, 0);
    fill (0, opaco2);
    textSize(35);
    text ("by: Michael Giacchino", width/2, height/2);
  }
  if (miPantalla >2400) {
    float opaco = map (miPantalla, 2400, 2850, 255,0);
    tint (255, opaco);
    image (michael, width/2.8, height/2+50);
  }
 
  //-----------------6TA PANTALLA Y FINAL
  if (miPantalla > 2850) {
  float opaco = map(miPantalla, 2900,3100, 255, 0);
    fill(255,opaco);
    textSize(60);
    text ("Dirección", width/2, height/4);
  }
    if (miPantalla >2850) {
    float opaco = map (miPantalla, 2850, 3100, 255, 0);
    tint (255, opaco);
    image (personajes,px2,height-100);  
  }
  if (miPantalla > 2850){
  float opaco2 = map (miPantalla, 2900, 3100, 255, 0);
    fill (0, opaco2);
    textSize(35);
    text ("Pete Docter\npixar", width/2, height/2);
  }
  if (miPantalla >2850) {
    float opaco = map (miPantalla, 2900, 3100, 255,0);
    tint (255, opaco);
    image (docter, width/2.8, height/2+50);
  } 
  
  if (miPantalla > 3100){
  float rectFondo = map (miPantalla, 3100, 3700, 0, 255);
    fill (0, 150, 255, rectFondo);
    noStroke();
    rect(0, 0, width, height);
    fill(0);
    textSize (60);
    text ("GRACIAS", width/2, height/2);
    
  }
  
  
  
 }
