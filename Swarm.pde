Map map;
Player player;
boolean[] keys = new boolean[256];
PImage loadingScreen, groundTexture, roofTexture, wallTexture;
String gameState = "Loading";

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);

  loadingScreen = loadImage("loadingScreen.jpeg");
  loadingScreen.resize(width, height);
  thread("loadEverything");
}

void draw()
{
  //loading
  if (gameState.equals("Loading"))
  {
    background(loadingScreen);
  } 
  
  //lobby
  else if(gameState.equals("Lobby"))
  {
    background(0);
    
    if(frameCount % 60 == 0)
    {
      background(loadingScreen);
      gameState = "Playing";
    }
  }
  
  //playing
  else if (gameState.equals("Playing"))
  {
    background(255);
    lights();
    ambientLight(180, 150, 80);

    map.render();
    player.render();
  }
}

void loadEverything()
{
  groundTexture = loadImage("groundTexture.jpg");
  roofTexture = loadImage("roofTexture.jpg");
  wallTexture = loadImage("wallTexture.jpg");

  map = new Map();
  player = new Player();
  gameState = "Lobby";
}
