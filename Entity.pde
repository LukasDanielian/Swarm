class Entity
{
  PVector pos;
  float baseSize, rot;
  int damage, speed, health, fullHealth, fireRate;

  Entity(PVector pos, float baseSize)
  {
    this.pos = pos;
    this.baseSize = baseSize;
  }

  void updateBounds()
  {
    float radius = getSize();

    if (pos.x > map.w/2 - radius)
      pos.x = map.w/2 - radius;
    else if (pos.x < -map.w/2 + radius)
      pos.x = -map.w/2 + radius;
    if (pos.z > map.d/2 - radius)
      pos.z = map.d/2 - radius;
    else if (pos.z < -map.d/2 + radius)
      pos.z = -map.d/2 + radius;
  }

  void applyDamage(int damage)
  {
    health -= damage;
    map.objects.add(new Text(new PVector(pos.x, pos.y - baseSize, pos.z), damage));

    if (health < 0)
      health = 0;
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
