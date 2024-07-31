Map map;
Player player;
boolean[] keys = new boolean[256];

void setup()
{
  fullScreen(P3D);
  shapeMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  
  map = new Map();
  player = new Player();
}

void draw()
{
  background(0);
  lights();
  ambientLight(200,200,200);
  
  map.render();
  player.render();
}
