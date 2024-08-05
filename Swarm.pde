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
  textSize(128);

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
    fill(0);
    rect(width * .5, height * .9, textWidth("Loading..."), height * .2, 30);
    fill(255);
    text("Loading...", width * .5, height * .87);
  }

  //lobby
  else if (gameState.equals("Lobby"))
  {
    background(0);

    if (frameCount % 60 == 0)
    {
      background(loadingScreen);
      fill(0);
      rect(width * .5, height * .9, textWidth("Loading..."), height * .2, 30);
      fill(255);
      text("Loading...", width * .5, height * .87);
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
