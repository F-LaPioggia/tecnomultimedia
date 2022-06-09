// Franco La Pioggia
// Ilusión optica tp2
// Legajo 88206/0
// url del video: https://youtu.be/FiyBVoWyeB0 


float r;
float c, c1;
float vel =random (0.002, -0.002);
int tam;
void setup () {
  size (500, 500); 
  c =random (0, 255);
  c1 =random (0, 255);
  tam = width;
  r = 0;
  fill (0);
  rect(0,0,width,height);
  noLoop();
}

void draw () {
  background (0);
  
  cuadradosConcentricos();

  if (key == 'd' || key == 'D') {
    vel += 0.0001;
  }
  if (key == 'a' || key == 'A') {
    vel -=0.0001;
  }
  
}

void mousePressed() {
  r =0;
  loop();
  
}

void keyPressed(){
if (key == 'r'|| key == 'R') {
      c =random (0, 255);
      c1 =random (0, 255);
     
   }
   if (key ==' '){
     
     noLoop();
     
   }
}
