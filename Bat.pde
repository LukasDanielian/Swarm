class Bat implements Enemy
{
  PVector pos, dir;
  float speed, rot, baseSize;
  int health, XP;

  Bat(PVector pos)
  {
    this.pos = pos;
    speed = 5;
    health = 20;
    XP = 10;
    baseSize = 150;
  }

  void render()
  {
    rot = -atan2(player.pos.z - pos.z, player.pos.x - pos.x) + HALF_PI;
    dir = new PVector(0, 1).rotate(-rot);
    push();
    translate(pos);
    translate(0, -100, 0);
    rotateY(rot);
    fill(0);
    box(150, 25, 25);
    pop();

    pos.x += dir.x * speed;
    pos.z += dir.y * speed;
    
    updateBounds();
  }
  
  void updateBounds()
  {
    if(pos.x > map.w/2)
      pos.x = map.w/2;
    else if(pos.x < -map.w/2)
      pos.x = -map.w/2;
    if(pos.z > map.d/2)
      pos.z = map.d/2;
    else if(pos.z < -map.d/2)
      pos.z = -map.d/2;
  }

  void renderBase()
  {
    noStroke();
    fill(50, 50, 50, 100);
    circle(pos.x, -pos.z, baseSize);
  }

  void checkCollision()
  {
    for (int i = 0; i < map.enemys.size(); i++)
    {
      Enemy enemy = map.enemys.get(i);

      if (enemy != this)
      {
        if (enemyCollision(this, enemy))
        {
          PVector ePos = enemy.getPos();
          float angle = atan2(pos.z - ePos.z, pos.x - ePos.x);
          float dist = getSize() + enemy.getSize();
          pos.x = ePos.x + cos(angle) * dist;
          pos.z = ePos.z + sin(angle) * dist;
        }
      }
    }

    if (dist(pos.x, pos.z, player.pos.x, player.pos.z) < player.getSize() + getSize())
    {
      float angle = atan2(pos.z - player.pos.z, pos.x - player.pos.x);
      float dist = player.getSize() + getSize();
      pos.x = player.pos.x + cos(angle) * dist;
      pos.z = player.pos.z + sin(angle) * dist;
    }
  }

  void attack()
  {
  }

  void applyDamage(int damage)
  {
    health -= damage;

    if (health < 0)
      health = 0;
  }

  boolean shouldRemove()
  {
    return health <= 0;
  }

  PVector getPos()
  {
    return pos;
  }

  float getSize()
  {
    return baseSize/2;
  }
}
