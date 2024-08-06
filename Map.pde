class Map
{
  ArrayList<Object> objects;
  ArrayList<Enemy> enemys;
  ArrayList<Projectile> projectiles;
  float w,d;
  int maxEnemys,spawnRate;
  
  Map()
  {
    objects = new ArrayList<Object>();
    enemys = new ArrayList<Enemy>();
    w = 20000;
    d = 12000;
    maxEnemys = 1000;
    spawnRate = 120;
    
    for(float x = -w/2 - 500; x <= w/2 + 500; x += 1000)
      objects.add(new House(new PVector(x,0,-d/2),0));
    
    for(float z = -d/2 - 1500; z <= d/2 + 1500; z += 1000)
    {
      objects.add(new House(new PVector(-w/2,0,z),HALF_PI));
      objects.add(new House(new PVector(w/2,0,z),-HALF_PI));
    }
  }
  
  void render()
  {
    //ground
    push();
    hint(DISABLE_DEPTH_TEST);
    translate(0,0,0);
    rotateX(-HALF_PI);
    
    for(float x = -w/2 + 500; x <= w/2 - 500; x += 1000)
    {
      for(float z = -d/2 - 1500; z <= d/2 - 500; z += 1000)
        image(groundTexture,x,z,1000,1000);
    }
    
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
      checkCollision(enemy);
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
    
    if(frameCount % 60 == 0 && spawnRate > 5)
    {
      spawnRate -= 5;
    }
  }
}
