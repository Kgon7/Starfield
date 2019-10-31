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
  noFill();
  stroke(255, 0, 0);
    ellipse(300,300,510,510);
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
    Bob[i].myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
}
class Particle
{
  double myX, myY, mySpeed, myAngle;
  int myColor;
  Particle()
  {
    myX = myY = 300;
    mySpeed = Math.random()* 2;
    myAngle = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  void show()
  {
    fill(myColor);
    ellipse((int)myX, (int)myY, 10, 10);
  }
  void move()
  {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    float pp = dist((float)myX, (float)myY, (float)300,(float)300);
    if(pp >= 249)
      myX = myY = 300;
  }
}

class OddballParticle extends Particle
{
  OddballParticle()
  {   
    myX = 0;
    myY = 300;
    mySpeed = 15;
    myAngle = 90;
    myColor = color(255, 255, 0);
  }
  void show()
  {
    fill(myColor);
    rect((int)myX, (int)myY, 20, 20);
  }
  void move()
  {
    myX = myX + 5;
  }
}

