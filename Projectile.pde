class Projectile implements Object
{
  PVector pos, tPos, dir;
  int  damage;
  Entity target;

  Projectile(PVector pos, PVector tPos, int damage, Entity target)
  {
    this.pos = pos;
    this.tPos = tPos;
    this.damage = damage;
    this.target = target;
  }

  void render()
  {
    push();
    translate(pos);
    noStroke();
    fill(255,0,0);
    sphere(25);
    pop();

    float rot = -atan2(tPos.z - pos.z, tPos.x - pos.x) + HALF_PI;
    dir = new PVector(0, 1).rotate(-rot);
    pos.x += dir.x * 50;
    pos.z += dir.y * 50;
  }

  boolean shouldRemove()
  {
    float dist = dist(pos.x, pos.y, pos.z, tPos.x, tPos.y, tPos.z);

    if (dist < ((target != null) ? target.getSize() : player.getSize()))
    {
      if (target != null)
        target.applyDamage(damage);
        
      return true;
    }

    return false;
  }
}
