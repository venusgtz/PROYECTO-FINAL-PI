import netP5.*;
import oscP5.*;

import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress direccionRemota;
int v = 0;
int c = 1;
int t = 0;

 void setup(){
  oscP5 = new OscP5(this, 12001);
  direccionRemota = new NetAddress("192.168.1.77", 12001);
  size(1000,800);
}

 void draw(){
  background(5,12,57);
  
  //Círculo azul grande
  strokeWeight(2);
  stroke(255);
  fill(15,41,255);
  ellipse(v+274,c*231,t+308,t+308);
  
  //Círculo negro
  strokeWeight(2);
  stroke(123,95,205);
  fill(0);
  ellipse(v+232,c*198,t+200,t+200);
  
  //circulos superiores izquierda
  noStroke();
  fill(236,125,144); //círculo rosa
  ellipse(v+62,c*105,t+52,t+52);
  
  fill(321,242,101);//circulo amarillo
  ellipse(v+46,c*38,t+22,t+22);
  
  fill(7,108,34,99);//circulo verde con transparencia superpuesto
  ellipse(v+459,c*180,t+104,t+104);
  
  //Circulo negro con contorno cian
  strokeWeight(4);
  stroke(32,206,224);
  fill(0);
  ellipse(v+459,c*180,t+24,t+24);
  
  //circulos superpuestos al azul grande
  noStroke();
  fill(255,172,15);//circulo naranja
  ellipse(v+367,c*314,t+92,t+92);
  
  fill(147,255,171);//circulo verde pistache
  ellipse(v+335,c*256,t+57,t+57);
  
  fill(231,216,71);//circulo amarillo
  ellipse(v+318,c*318,t+60,t+60);
  
  fill(15,173,255);//azul turqueza
  ellipse(v+384,c*393,t+78,t+78);
}

  void oscEvent(OscMessage theOscMessage){
    
  if (theOscMessage.checkAddrPattern("/x") == true) {
    //asigna el valor entero a la variable x
    c = theOscMessage.get(0).intValue();
  }

  //si el mensaje está etiquetado como "/y"
  if (theOscMessage.checkAddrPattern("/y") == true) {
    //asigna el valor entero a la variable y
    v = theOscMessage.get(0).intValue();
  }
  
  //si el mensaje está etiquetado como "/t"
  if (theOscMessage.checkAddrPattern("/t") == true) {
    //asigna el valor entero a la variable t
    t = theOscMessage.get(0).intValue();
  }
}
