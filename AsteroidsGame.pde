//your variable declarations here
SpaceShip bob = new SpaceShip();
Star[] star = new Star[200];
ArrayList <Asteroids> sally = new ArrayList <Asteroids>();
int cNum;

public void setup() 
{
  cNum = 10; //change # of asteroids


  size(400, 400);

//making stars
  for(int i = 0; i < 200; i++)
  {
    star[i] = new Star();
  }
  //asteroids
  for(int i = 0; i < cNum; i++)
  {
    sally.add(new Asteroids());
  }
}
public void draw() 
{
  background(0);

//spaceship move
  bob.move();
  bob.show();

//showing stars
  for(int i = 0; i < 200; i++)
  {
    star[i].show();
  }
//asteroids

  for(int i = 0; i < cNum; i++)
  {
    sally.get(i).show();
    sally.get(i).move();
  }
}



  public void keyPressed()
  {

    //accelerate

    if(keyCode == UP)
    {
      bob.accelerate(0.5);
    }
    else if(keyCode == DOWN)
    {
      bob.accelerate(-0.5);
    }

    //rotate


    if(keyCode == RIGHT)
    {
      bob.rotate(10);
    }
    else if(keyCode == LEFT)
    {
      bob.rotate(-10);
    }
  }
  
//hyperspace
  public void keyTyped()
  {
    if(key == 'h')
    {
      bob.setX((int)(Math.random()*400)+1);
      bob.setY((int)(Math.random()*400)+1);
      bob.setDirectionX(0);
      bob.setDirectionY(0);
      bob.setPointDirection(0);
    }
  }


class SpaceShip  extends Floater
{   
  public SpaceShip()
  {

  //# of corners the spaceship has
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    

    myCenterX = 100;
    myCenterY = 100;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;

    myColor = 255;

  }


    public void setX(int x)
      {
        myCenterX = x;
      }
    public int getX()
      {
        return (int) myCenterX;
      }
    public void setY(int y)
      {
        myCenterY = y;
      }
    public int getY()
      {
        return (int) myCenterY;
      }
    public void setDirectionX(double x)
      {
        myDirectionX = x;
      }
    public double getDirectionX()
      {
        return myDirectionX;
      }
    public void setDirectionY(double y)
      {
        myDirectionY = y;
      }
    public double getDirectionY()
      {
        return myDirectionY;
      }
    public void setPointDirection(int degrees)
      {
        myPointDirection = degrees;
      }
    public double getPointDirection()
      {
        return myPointDirection;
      }
}

class Star
{
  private int myX, myY;
    public Star()
    {
      myX = (int)(Math.random()*400);
      myY = (int)(Math.random()*400);
    }
    public void show()
    {
      fill(255);
      ellipse(myX, myY, 3, 3);
    }


}


class Asteroids extends Floater
{
  private int myNum;
  private int rotSpeed;
  public Asteroids ()
  {
    corners = 12;
    xCorners = new int[corners];
    yCorners = new int[corners];
    
    xCorners[0] = 0;
    yCorners[0] = 10;

    xCorners[1] = 3;
    yCorners[1] = 9;

    xCorners[2] = 5;
    yCorners[2] = 7;

    xCorners[3] = 7;
    yCorners[3] = 6;

    xCorners[4] = 7;
    yCorners[4] = 3;

    xCorners[5] = 6;
    yCorners[5] = -1;

    xCorners[6] = 3;
    yCorners[6] = -3;

    xCorners[7] = 0;
    yCorners[7] = 3;

    xCorners[8] = -3;
    yCorners[8] = -2;

    xCorners[9] = -4;
    yCorners[9] = 2;

    xCorners[10] = -6;
    yCorners[10] = 5;


    xCorners[11] = -4;
    yCorners[11] = 9;

    rotSpeed = (int)((Math.random()*8)-4);
    myCenterX = (int)(Math.random()*400);
    myCenterY = (int)(Math.random()*400);
    myDirectionX = (Math.random()*8)-4;
    myDirectionY = (Math.random()*8)-4;
    myPointDirection = (Math.random()*400);

    myColor = 50;



  }


    public void setX(int x)
      {
        myCenterX = x;
      }
    public int getX()
      {
        return (int) myCenterX;
      }
    public void setY(int y)
      {
        myCenterY = y;
      }
    public int getY()
      {
        return (int) myCenterY;
      }
    public void setDirectionX(double x)
      {
        myDirectionX = x;
      }
    public double getDirectionX()
      {
        return myDirectionX;
      }
    public void setDirectionY(double y)
      {
        myDirectionY = y;
      }
    public double getDirectionY()
      {
        return myDirectionY;
      }
    public void setPointDirection(int degrees)
      {
        myPointDirection = degrees;
      }
    public double getPointDirection()
      {
        return myPointDirection;
      }

  public void move()
  {
    rotate(rotSpeed);
    super.move();
  }


}































abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

