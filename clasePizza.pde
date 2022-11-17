class Pizza {

  PImage p;
  int px, py, tam;
  Pizza (){
    p = loadImage ("pizza.png");
    
  }

  void dibujarPizza (int px, int py, int tam){
    image (p, px, py, tam, tam);
    
  }


}
