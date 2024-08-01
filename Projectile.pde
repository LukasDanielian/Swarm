class Projectile implements Object
{
  PVector pos, tPos, dir;
  float speed, size;
  int damage;
  Enemy target;

  Projectile(PVector pos, PVector tPos, float speed, float size, int damage, Enemy target)
  {
    this.pos = pos;
    this.tPos = tPos;
    this.speed = speed;
    this.size = size;
    this.damage = damage;
    this.target = target;
  }

  void render()
  {
    push();
    translate(pos);
    noStroke();
    fill(#00FF9F);
    sphere(size);
    pop();

    float rot = -atan2(tPos.z - pos.z, tPos.x - pos.x) + HALF_PI;
    dir = new PVector(0, 1).rotate(-rot);
    pos.x += dir.x * speed;
    pos.z += dir.y * speed;
  }

  boolean shouldRemove()
  {
    float dist = dist(pos.x, pos.y, pos.z, tPos.x, tPos.y, tPos.z);

    if (dist < ((target != null) ? target.getSize() : player.getSize()))
    {
      if (target != null)
        target.applyDamage(damage);
      //else
        //player.applyDamage(damage);
      return true;
    }

    return false;
  }
}
