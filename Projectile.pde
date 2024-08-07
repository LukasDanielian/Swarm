class Projectile implements Object
{
  PVector startPos, pos, dir;
  int damage;
  ArrayList<Enemy> alreadyHit;

  Projectile(PVector pos, PVector tPos, int damage)
  {
    startPos = pos.copy();
    this.pos = pos;
    this.damage = damage;
    alreadyHit = new ArrayList<Enemy>();

    float rot = -atan2(tPos.z - pos.z, tPos.x - pos.x) + HALF_PI;
    dir = new PVector(0, 1).rotate(-rot);
  }

  void render()
  {
    push();
    translate(pos);
    noStroke();
    fill(255, 0, 0);
    sphere(25);
    pop();

    pos.x += dir.x * 50;
    pos.z += dir.y * 50;
    checkDamage();
  }

  void checkDamage()
  {
    for (int i = 0; i < map.enemys.size(); i++)
    {
      Enemy enemy = map.enemys.get(i);

      if (!alreadyHit.contains(enemy))
      {
        PVector ePos = enemy.getPos();

        if (dist(pos.x, pos.z, ePos.x, ePos.z) < enemy.getSize())
        {
          enemy.applyDamage(damage);
          alreadyHit.add(enemy);
        }
      }
    }
  }

  boolean shouldRemove()
  {
    return dist(startPos.x, startPos.z, pos.x, pos.z) >= 1700;
  }
}
