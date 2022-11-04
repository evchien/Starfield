PImage img;

class Particle{
  double myX, myY, myAngle, mySpeed, mySize;
  int myColor;
  Boolean edge;
  Particle(){ //default no argument constructor
    myX = 200;
    myY = 200;
    myAngle = Math.random()*2*PI;
    mySpeed = Math.random()*5;
    myColor = color(252,245,99);
    edge = false;
  }
  void move(){
    if(edge == false){
      myY = myY + (Math.sin(myAngle)*mySpeed);
      myX = myX + (Math.cos(myAngle)*mySpeed);
    }
  }
  void show(){
    noStroke();
    fill(myColor);
    mySize = dist(200.0,200.0,(float)myX,(float)myY) / 35;
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void edge(){
    if(myY > height || myX > width){
      edge = true;
      myY = 200;
      myX = 200;
      mySpeed = Math.random()*2.5;
      myAngle = Math.random()*2*PI;
    }
    else
      edge = false;
  }
} //end of Particle class

class ShootingStar extends Particle{ //oddball
  ShootingStar(){
    myX = 200;
    myY = 200;
    myAngle = Math.random()*2*PI;
    mySpeed = Math.random()+50;
    myColor = color(255,247,0);
  }
  void move(){
    if(edge == false){
      myY = myY + (Math.sin(myAngle)*mySpeed);
      myX = myX + (Math.cos(myAngle)*mySpeed);
    }
  }
  void show(){
    image(img, (float)myX, (float)myY);
  }
  void edge(){
    if(myY > height || myX > width){
      edge = true;
      myY = 200;
      myX = 200;
      mySpeed = Math.random()*2.5;
      myAngle = Math.random()*2*PI;
    }
    else
      edge = false;
  }
} //end of Oddball class

Particle [] bob;
ShootingStar evie;

void setup(){
  size(400,400);
  img = loadImage("star.png");
  bob = new Particle[500];
  evie = new ShootingStar();
  for(int i = 0; i < bob.length; i++){
    bob[i] = new ShootingStar();
  }
  for(int i = 3; i < bob.length; i++){
    bob[i] = new Particle();
  }
}

void draw(){
  background(0);
  for(int i = 0; i < bob.length; i++){
    bob[i].edge();
    bob[i].move();
    bob[i].show();
  }
}
