/*
Name: Shane Whitmore
Programme Name : Adventure

I have programmed my own version of a 1980's game called 'Adventure'.
Adeventure was released on the atari 2600.
The reason I picked adventure is because it was the first game to have an easter egg.
The easter egg was the hidden message 'Created by Warren Robinett'.
For my animation I recreated that easter only I added my own name.
The Animation is mainly to demonstrate the basic player movements and object collision in video game development.

The known problems I have found.

The player can be forced into an object by allowing one edge of the player to enter the boundary and then pressing the opposite button used.
I had to add a grey cover in the top centre of the screen because the 'spikes on top of castle' would align with the edge of the castle pillars.
When trying to do a nested while loop for the gate of the castle, the entire map would be removed, I have left the nested while loop as a comment to show where I would have put it.


The video I used to learn and understand object collision was 'P5 js 26 creating collisions, walls, and barriers' found on youtube.
https://www.youtube.com/watch?v=JV5XBmaQdIA
*/



float xCoord = 200; //xCoordinate starting position of player
float yCoord = 600; //yCoordinate starting position of player
int speed = 7; //speed at which the player can travel
int pWidth = 30; //player width
int pHeight = 30; //player height

float rValue = 0; //Red colour value
float gValue = 125; //Green colour value
float bValue = 175; //Blue colour value

int xCastle = 170;  //castle x starting Coordinates
int yCastle = 0; //castle  y starting Coordinates
int castleWidth = 370; //Castle Width on x Axis
int castleHeight = 320;   //Castle Height on y Axis

int wWidth = 250; //setting width of wall
int wHeight = 100; //setting height of wall
int xWall1 =  0; //setting coordinates for first wall on x-Axis
int yWall1 = 400; //setting coordinate of first wall on y-Axis
int xWall2 = 419; //setting coordinate of second wall on x-Axis
int yWall2 = 400; //setting coordinate of second wall on y-Axis

void setup()
{
  size(700,950); //setting screen size
  noCursor(); //remove cursor
  frameRate(50); //slow down framerate
  noStroke(); //remove all outlines

} //close 'void setup'

void draw()
{
  background(160); //background colour is light grey
  cullision(); //setting boundary and hard objects
  castle(); //castle in yellow room
  yellowRoom(); //yellow room
  purpleRoom(); //purple room
  player(); //player
  writing(); //Easter Egg
  
} //close 'void draw'

void cullision()
{
  if(xCoord < 48)  //if the player touches the left wall...
  {
    xCoord = xCoord + speed;//then he stops
  }
  if(yCoord < 47) //if the player touches the top...
  {
    yCoord = yCoord + speed; //then he stops
  }
   if(xCoord > 624 ) //if the player touches the right wall...
  {
    xCoord = xCoord - speed; //then he stops
  }
   if(yCoord > 873) //if the player touches the bottom...
  {
    yCoord = yCoord - speed; //then he stops
  }
  if((xCoord > castleWidth- xCastle - 50 && xCoord < xCastle+castleWidth && yCoord > yCastle-castleHeight && yCoord < yCastle + castleHeight) || ( xCoord < xWall1 + wWidth && yCoord > yWall1+75 - wHeight && yCoord < yWall1 + wHeight) || (xCoord > xWall2 && xCoord < xWall2 + wWidth && yCoord > yWall2 - 30 && yCoord < yWall2 +wHeight+5))
  {
    speed = speed*-1;
  }
  else
  speed=7;

} //close 'void collision'

void castle()
{
  int pwidth=135; //setting thinckness of pillar
  int wallWidth = 93;
  int j = 0;
  int xGate = 327;
  //int yGate = 245;
  
  fill(160); //setting colour to grey
  rect(xCastle,yCastle,castleWidth,castleHeight); //setting castle boundary
  fill(215,215,0);//set colour to yellow
  rect(220,170,wallWidth,150); //castle left wall
  rect(400,170,wallWidth,150); //castle right wall
  rect(220,140,270,100);//doorway
  rect(170,50,pwidth,170);// castle left pillar
  rect(405,50,pwidth,170);//castle right pillar
  
  for(int i = 0; i < 12; i++)
  {
    fill(215,215,0);//set colour to yellow
    rect(57*i,0,25,50);  //spikes on top of castle
    
    fill(160); //grey colour
    rect(305,0,100,60); //cover for 'spikes'
  }
  
    while(j < 4)
    {
      fill(0);
      rect(xGate,240,8,80);
      xGate= xGate + 15;
      j++;
    
     // while ( j < 4)
      //{
      //  fill(0);
      //  rect(320,yGate,300,8);
      //  yGate = yGate + 15;
      //  j++; 
    }
   
} //close 'void castle'

void yellowRoom()
{ 
  fill(215,215,0);//colour yellow
  rect(0,0,50,450); //right yellow wall
  rect(0,400,wWidth,wHeight);//botoum left yellow wall
  rect(450,400,wWidth,wHeight); //bottom right yellow wall
  rect(650,0,50,450); //right yellow wall
  rect(0,0,171,50); //top left yellow wall
  rect(537,0,width,50); //top right yellow wall
  
} //close 'void yellowRoom'

void purpleRoom()
{
   fill(150,0,150); //colour purple
  rect(0,450,wWidth,50); //top left purple wall
  rect(450,450,wWidth,50); //top right purple wall
  rect(0,900,width,50); //bottom purple wall
  
} //close 'void purpleRoom'
  
void player()
{
  rect(xCoord,yCoord,pWidth,pHeight); //player size
  
} //close 'void player'

  void keyPressed()
  {
    if (key == 'w')    //if 'w' is pressed move player up
    {
      yCoord = yCoord - speed;
    }
    if (key == 'a')    //if 'a' is pressed move player left
    {
      xCoord = xCoord - speed;
    }
    if(key =='s')     //if 's' is pressed move player down
    {
      yCoord = yCoord + speed;
    }
    if(key == 'd')     //if 'd' is pressed move player right
    {
      xCoord = xCoord + speed;
    }
      
  } //close 'void keyPressed'
  
void writing()
  {
  fill(rValue,gValue,bValue); //setting text colour to RGB
  textAlign(CENTER); //Alligning text 
  text("Created By Shane Whitmore",350,666); //positioning text 
  
  if (rValue < 255) //if rValue is less than 255...
  rValue = rValue + 1; //then add one on to rValue
  
  else 
  rValue = 0; //if rValue is 255 then reset it to 0
  
  if(gValue < 255) //if gValue is less than 255....
  gValue = gValue + 6; //then add six on to gValue
  
  else
  gValue = 0; //if gValue is 255 then reset it to 0
  
  if(bValue < 255) //if bValue is less than 255....
  bValue = bValue + 11; //then add 11 on to bValue
  
  else bValue = 0; //if bValue is 255  then reset it to 0
  
  } //close 'void writing'
