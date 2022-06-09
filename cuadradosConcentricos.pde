
void cuadradosConcentricos(){

  
  strokeWeight(3);
  translate (width/2,height/2);
  for (int i =tam; i>0; i-=31){
    
    rectMode (CENTER);
    rect (0, 0, i,i);
    noFill();
     float verde = map (i,0,tam,0,255);
     float blanco = map (i,0,tam,255,100);
     
    if (i%2 == 0){
     stroke (c1,c,c1,blanco);
     rotate (r+=vel);
      }else {
      stroke (c,verde,c1);
      rotate (r-=vel);
      }  
      
  }
  fill (255,0,0);
  ellipse (0,0,10,10);
  
  fill (0);

}
