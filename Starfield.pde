Particle[] Bob;
void setup()
{
  size(600, 600);
  Bob = new Particle[250];
  for (int i = 0; i < Bob.length; i++)
    Bob[i] = new Particle();
  Bob[0] = new OddballParticle();
}
void draw()
{
  background(0);
  noStroke();
  for (int i = 0; i < Bob.length; i++)
    Bob[i].move();
  for (int i = 0; i < Bob.length; i++)
    Bob[i].show();
}
void mousePressed()
{
  for (int i = 1; i < Bob.length; i++)
  {
    Bob[0].myX = 0;
    Bob[0].myY = 300;
    Bob[i].myX = Bob[i].myY = 300;
    Bob[i].mySpeed = Math.random()* 2;
    Bob[i].myAngle = Math.random()*2*Math.PI;
    Bob[i].myColor = (255);
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle, pp;
  int myColor;
  Particle()
  {
    myX = Math.random()*20+275;
    myY = Math.random()*20+275;
    mySpeed = Math.random()* 2;
    myAngle = Math.random()*2*Math.PI;
    myColor = color(255,255,0);
    pp = dist((float)myX,(float)myY,300,300);
  }
  void show()
  {
    fill(255,255,0);
    ellipse((int)myX, (int)myY, (int)pp/10, (int)pp/10);
  }
  void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    if (myX <= 0) 
      myX = myY = 300;
    else if (myX >= 600)
      myX = myY = 300;
    else if (myY <= 0)
      myX = myY = 300;
    else if (myY >= 600)
      myX = myY = 300;  
      
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {   
    myX = 50;
    myY = (int)(Math.random()*200)+200;
    mySpeed = 15;
    myAngle = 90;
    myColor = color(255, 0, 0);
  }
  void show()
  {
    fill(myColor);
    rect((int)myX, (int)myY, 20, 20);
}
  void move()
  {
    myX = myX + 5;
    if (myX > 540)
      myX = 50;
      myY = (int)(Math.random()*200)+200;
  }
}
