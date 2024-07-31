class Enemy
{
  PVector pos, dir;
  float speed, baseSize;
  float rot;
  int fullHealth, health, XP;

  Enemy(PVector pos, float speed, float baseSize, int health, int XP)
  {
    this.pos = pos;
    this.speed = speed;
    this.baseSize = baseSize;
    this.health = health;
    fullHealth = health;
    this.XP = XP;
  }

  void render()
  {
    push();
    translate(pos);
    translate(0,-baseSize,0);
    rotateX(QUARTER_PI);
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(0,0,baseSize,10);
    rectMode(CORNER);
    noStroke();
    fill(0,255,0);
    rect(-baseSize/2,-5,map(health,0,fullHealth,0,baseSize),10);
    rectMode(CENTER);
    pop();
    
    rot = -atan2(player.pos.z - pos.z, player.pos.x - pos.x) + HALF_PI;
    dir = new PVector(0, 1).rotate(-rot);
    pos.x += dir.x * speed;
    pos.z += dir.y * speed;
    updateBounds(pos);
  }

  void attack() 
  {
    
  }

  void renderBase()
  {
    noStroke();
    fill(50, 50, 50, 100);
    circle(pos.x, -pos.z, baseSize);
  }

  void applyDamage(int damage)
  {
    health -= damage;

    if (health < 0)
      health = 0;
  }

  void updateXZ(float x, float z)
  {
    pos.x = x;
    pos.z = z;
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
