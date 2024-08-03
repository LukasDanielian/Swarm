class Entity
{
  PVector pos;
  float speed, baseSize, rot;
  int health, fullHealth;
  Weapon weapon;

  Entity(PVector pos, float speed, float baseSize, int health, int damage, float range, float fireRate, boolean friendly)
  {
    this.pos = pos;
    this.speed = speed;
    this.baseSize = baseSize;
    this.health = health;
    fullHealth = health;
    weapon = new Weapon(pos, damage, range, fireRate, friendly);
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
