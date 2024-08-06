class Enemy extends Entity
{
  PVector dir;
  int XP;

  Enemy(PVector pos, float baseSize, int damage, int speed, int health, int fireRate, int XP)
  {
    super(pos, baseSize);
    this.damage = damage;
    this.speed = speed;
    this.health = fullHealth = health;
    this.fireRate = fireRate;
    this.XP = XP;
  }

  void render()
  {
    push();
    translate(pos);
    translate(0, -baseSize, 0);
    rotateX(QUARTER_PI);
    noFill();
    stroke(0);
    strokeWeight(1);
    rect(0, 0, baseSize, 10);
    rectMode(CORNER);
    noStroke();
    fill(0, 255, 0);
    rect(-baseSize/2, -5, map(health, 0, fullHealth, 0, baseSize), 10);
    rectMode(CENTER);
    pop();

    rot = -atan2(player.pos.z - pos.z, player.pos.x - pos.x) + HALF_PI;
    dir = new PVector(0, 1).rotate(-rot);

    if (dist(pos.x, pos.z, player.pos.x, player.pos.z) > player.getSize())
    {
      pos.x += dir.x * speed;
      pos.z += dir.y * speed;
    }

    updateBounds();
    attack();
  }

  void attack()
  {
    if (frameCount % fireRate == 0)
    {
      if (enemyCollision(this, player))
        player.applyDamage(damage);
    }
  }

  void renderBase()
  {
    noStroke();
    fill(50, 50, 50, 100);
    circle(pos.x, -pos.z, baseSize);
  }

  void updateXZ(float x, float z)
  {
    pos.x = x;
    pos.z = z;
  }

  boolean shouldRemove()
  {
    if (health <= 0)
    {
      player.addXP(XP);
      return true;
    }

    return false;
  }
}
