Map map;
Player player;
boolean[] keys = new boolean[256];

PImage groundTexture, roofTexture, wallTexture;

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  
  groundTexture = loadImage("groundTexture.jpg");
  roofTexture = loadImage("roofTexture.jpg");
  wallTexture = loadImage("wallTexture.jpg");
  
  map = new Map();
  player = new Player();
}

void draw()
{
  background(255);
  lights();
  ambientLight(180,150,80);
  
  map.render();
  player.render();
}
