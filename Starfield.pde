PImage img;

class Particle{
  double myX, myY, myAngle, mySpeed, mySize;
  int myColor;
  Boolean distance;
  Particle(){ //default no argument constructor
    myX = 200;
    myY = 200;
    myAngle = Math.random()*2*PI;
    mySpeed = Math.random()*5+2;
    myColor = color(252,245,99);
    distance = false;
  }
  void move(){
    if(distance == false){
      myY = myY + (Math.sin(myAngle)*mySpeed);
      myX = myX + (Math.cos(myAngle)*mySpeed);
    }
  }
  void show(){
    noStroke();
    fill(myColor);
    mySize = dist(200,200,(float)myX,(float)myY) / 35;
    ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
  }
  void edge(){
    if(myY > height || myX > width){
      distance = true;
      myY = 200;
      myX = 200;
      mySpeed = Math.random()*2.5;
      myAngle = Math.random()*2*PI;
    }
    else
      distance = false;
  }
} //end of Cloud class

class ShootingStar extends Particle{ //oddball
  ShootingStar(){
    myX = 200;
    myY = 200;
    myAngle = Math.random()*2*PI;
    mySpeed = 5;
    myColor = color(255,247,0);
  }
  void show(){
    image(img, (float)myX, (float)myY);
    img.resize(25,0);
  }
} //end of oddball class

Particle [] bob;

void setup(){
  size(400,400);
  img = loadImage("star.png");
  bob = new Particle[500];
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
