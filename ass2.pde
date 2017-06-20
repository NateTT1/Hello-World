//fizzy locations
int x = 405;
int y = 100;

//eye rotation
int spaceX1 = 10;
int spaceY1 = 10;
int spaceX2 = 10;
int spaceY2 = 10;

//fizzy size
int fSize = 55;

//speed of fizzy
int speedX = 0;
int speedY = 5;

//changing directions
int directionY = 1;
int directionX = 1;

//amount of rupees
int rupeeCount;

//boolean position
int rupeePos[][];

//array of whether its rupee is visible
boolean[] isCollected;

void setup() {
  //size of grid
  size(810, 810);

  //idk what this does really but I've seen it been used
  smooth();

  //array size
  rupeeCount = 16;

  //rupee positions?
  rupeePos=new int[][]{{405,675},{315,585},{225,495},{135,405},{135,315},{135,225},{225,135},{315,135},{405,225},{495,135},{585,135},{675,225},{675,315},{675,405},{585,495},{495,585},{405,675}};

  //is the rupee visible?
  isCollected = new boolean[rupeeCount];
}



void draw() 
{

  //white background
  background(0);

  //initialise postion of rupees
  for (int i = 0; i<rupeeCount; i++)
  {
    if (dist(x, y, rupeePos[i][0], rupeePos[i][1]) <= fSize)
    {
      isCollected[i] = true;
    }
    if (isCollected[i])
    {
      int rupeeX = rupeePos[i][0];
      int rupeeY = rupeePos[i][1];
      fill(0, 255, 0);
      rect(rupeeX, rupeeY, 20, 20);
    }
  }

  //draws character
  drawFizzy(x, y, spaceX1);
  drawPoles();

  //initializes movement
  y = y + speedY;
  x = x + speedX;

  //bounce
  if (y >= (height-fSize/2) || y <= (fSize/2)) 
  {
    speedY = speedY *- directionY;
    spaceY1 = spaceY1 *- directionY;
    spaceY2 = spaceY2 *- directionY;
  }

  //bounce
  if (x >= (width-fSize/2) || x <= (fSize/2)) 
  {
    speedX = speedX *- directionX;
    spaceX1 = spaceX1 *- directionX;
    spaceX2 = spaceX2 *- directionX;
  }
}

void keyPressed() 
{
  //moves up
  if (key == 'w') 
  {
    speedX = 0;
    speedY = -5;
    spaceY1 = -10;
    spaceY2 = -10;
    spaceX1 = -10;
    spaceX2 = -10;
  } 
  else if (key=='s') 
  {
    //moves down
    speedX = 0;
    speedY = 5;
    spaceY1 = 10;
    spaceX2 = -10;
    spaceX1 = -10;
    spaceY2 = 10;
  } 
  else if (key=='a') 
  {
    //moves left
    speedX = -5;
    speedY = 0;
    spaceX1 = -10;
    spaceY1 = -10;
    spaceX2 = 10;
    spaceY2 = 10;
  } 
  else if (key=='d')
  {
    //moves right
    speedX = 5;
    speedY = 0;
    spaceX1 = 10;
    spaceY2 = -10;
    spaceX2 = -10;
    spaceY1 = 10;
  }
}

//draw fizzy & facing certain direction
void drawFizzy(int x, int y, int rot) 
{
  //body
  fill(255, 0, 0);
  ellipse(x, y, fSize, fSize);

  //eyes
  fill(255);
  ellipse(x - spaceX2, y + spaceY2, fSize/5, fSize/5);
  ellipse(x + rot, y + spaceY1, fSize/5, fSize/5);
}

//draw poles loop
void drawPoles() 
{
  //creates poles
  for (float polex = 90; polex < 810; polex += 90) 
  {
    for (float poley = 90; poley < 810; poley += 90) 
    {
      fill(255);
      ellipse(polex, poley, 10, 10);
    }
  }
}