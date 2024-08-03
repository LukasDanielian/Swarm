class Enemy extends Entity
{
  PVector dir;
  int XP;

  Enemy(PVector pos, float speed, float baseSize, int health, int damage, float range, float fireRate, int XP)
  {
    super(pos, speed, baseSize, health, damage, range, fireRate, false);
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

    if (dist(pos.x, pos.z, player.pos.x, player.pos.z) > weapon.range)
    {
      pos.x += dir.x * speed;
      pos.z += dir.y * speed;
    }

    updateBounds();
    weapon.attack();
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
    return health <= 0;
  }
}
