class Weapon
{
  PVector pos, tPos;
  int damage;
  float range, fireRate;
  boolean friendly;

  Weapon(PVector pos, int damage, float range, float fireRate, boolean friendly)
  {
    this.pos = pos;
    this.damage = damage;
    this.range = range;
    this.fireRate = fireRate;
    this.friendly = friendly;
  }

  void attack()
  {
    if (frameCount % fireRate == 0)
    {
      Entity target = null;

      if (friendly)
        target = getClosestEnemy(pos, range);
        
      else
      {
        if(dist(pos.x,pos.z,player.pos.x,player.pos.z) < range)
          target = player;
      }

      if (target != null)
      {
        tPos = target.getPos();
        map.objects.add(new Projectile(pos.copy(), target.getPos(), damage, target));
      }
    }
  }
}
