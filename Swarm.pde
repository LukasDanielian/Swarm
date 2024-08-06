Map map;
Player player;
boolean[] keys = new boolean[256];
PImage loadingScreen, groundTexture, roofTexture, wallTexture, HODL;
String gameState = "Loading";
PFont font;
String[] upgradeNames = {"Damage", "Speed", "Health", "Fire rate", "Ability"};
PImage[] upgradeImages = new PImage[5];

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(128);

  font = loadFont("fontData.vlw");
  textFont(font, 128);
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
    push();
    fill(#5D1EB7);
    textSize(100);
    text("Danielian Softworks®", width * .5, height * .05);
    fill(0);
    textSize(128);
    text("Loading...", width * .5, height * .9);
    pop();
  }

  //lobby
  else if (gameState.equals("Lobby"))
  {
    background(0);

    if (frameCount % 60 == 0)
    {
      background(loadingScreen);
      push();
      fill(#5D1EB7);
      textSize(100);
      text("Danielian Softworks®", width * .5, height * .05);
      fill(0);
      textSize(128);
      text("Loading...", width * .5, height * .9);
      pop();
      gameState = "Playing";
    }
  }

  //playing
  else if (gameState.equals("Playing"))
  {
    background(255);
    noCursor();
    lights();
    ambientLight(180, 150, 80);

    player.updateKeys();
    player.updateBounds();
    player.updateCam();
    map.render();
    player.render();
  }

  //upgrading
  else if (gameState.equals("Upgrading"))
  {
    renderUpgrades();
  }
}

void loadEverything()
{
  groundTexture = loadImage("groundTexture.jpg");
  roofTexture = loadImage("roofTexture.jpg");
  wallTexture = loadImage("wallTexture.jpg");
  HODL = loadImage("HODL.JPG");
  upgradeImages[0] = loadImage("damage.png");
  upgradeImages[1] = loadImage("speed.png");
  upgradeImages[2] = loadImage("health.png");
  upgradeImages[3] = loadImage("fireRate.png");
  upgradeImages[4] = loadImage("ability.png");

  map = new Map();
  player = new Player();
  gameState = "Lobby";
}
