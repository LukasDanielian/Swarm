class Map
{
  ArrayList<Object> objects;
  ArrayList<Enemy> enemys;
  float w,d;
  int maxEnemys,spawnRate;
  
  Map()
  {
    objects = new ArrayList<Object>();
    enemys = new ArrayList<Enemy>();
    w = 20000;
    d = 12000;
    maxEnemys = 100;
    spawnRate = 120;
    
    for(int i = 0; i < 2000; i++)
      objects.add(new Grass(w,d));
  }
  
  void render()
  {
    //ground
    push();
    hint(DISABLE_DEPTH_TEST);
    translate(0,0,0);
    rotateX(-HALF_PI);
    fill(#086407);
    rect(0,0,w,d);
    
    for(int i = 0; i < enemys.size(); i++)
      enemys.get(i).renderBase();
    
    player.renderBase();
    hint(ENABLE_DEPTH_TEST);
    pop();
    
    //objects
    for(int i = 0; i < objects.size(); i++)
    {
      Object object = objects.get(i);
      object.render();
      
      if(object.shouldRemove())
      {
        objects.remove(i);
        i--;
      }
    }
    
    //enemys
    for(int i = 0; i < enemys.size(); i++)
    {
      Enemy enemy = enemys.get(i);
      enemy.checkCollision();
      enemy.render();
      
      if(enemy.shouldRemove())
      {
        enemys.remove(i);
        i--;
      }
    }
    
    addEnemys();
  }
  
  //spawns enemys
  void addEnemys()
  {
    if(frameCount % spawnRate == 0 && enemys.size() < maxEnemys)
    {
      float theta = random(0,TWO_PI);
      float dist = random(1500,5000);
      PVector pos = new PVector(player.pos.x + cos(theta) * dist,0,player.pos.z + sin(theta) * dist);
      
      enemys.add(new Bat(pos));
    }
  }
}
