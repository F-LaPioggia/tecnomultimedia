class Personaje {

  int ux, uy,tamaX,tamaY;
  PImage [] movI;
  PImage [] movD;
  int mover;
  boolean direccion;
  Colision colisionP;
  
  
  Personaje (){
    movI = new PImage [7];
    movD = new PImage [7];
    
    for (int i = 0; i<7; i ++){
      
      movI [i] = loadImage ("personajeInv" +i+ ".png");
      movD [i] = loadImage ("personaje"+i+".png");
    }
    
    ux = 50;
    uy = 40;
    tamaX =50;
    tamaY = 90;  
    direccion = true;
    colisionP = new Colision(ux,uy,tamaX,tamaY);
  }
  
    void dibujarPersonaje(){
      
     if (direccion) { 
     image (movI[mover], ux, uy); 
     } else {   
         image (movD[mover],ux, uy);
       }
       
      colisionP.dibujarColision(ux,uy,tamaX,tamaY);
      
  }
    
    void moverPersonaje(int tecla){
      
      if (frameCount%4== 0){ //velocidad de mov.
        if (ux>0 && tecla == LEFT ){
          ux -=10;
          direccion = true;
        }
        if (ux<width-50 && tecla == RIGHT){
          ux +=10;
          direccion = false;
        }
        if (uy<height-110 && tecla == DOWN){
          uy +=15;
          
        }
        if (uy>0 && tecla == UP){
          uy -=15;
          
        }
       
        mover ++;
        mover = mover%7;
      }
    
    }
    
}
