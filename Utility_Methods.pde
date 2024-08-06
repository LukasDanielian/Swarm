void translate(PVector v)
{
  translate(v.x, v.y, v.z);
}

void checkCollision(Enemy curr)
{
  PVector cPos = curr.getPos();

  for (int i = 0; i < map.enemys.size(); i++)
  {
    Enemy other = map.enemys.get(i);

    if (curr != other)
    {
      if (enemyCollision(curr, other))
      {
        PVector ePos = other.getPos();
        float angle = atan2(cPos.z - ePos.z, cPos.x - ePos.x);
        float dist = curr.getSize() + other.getSize();
        curr.updateXZ(ePos.x + cos(angle) * dist, ePos.z + sin(angle) * dist);
      }
    }
  }

  if (enemyCollision(curr, player))
  {
    float angle = atan2(curr.getPos().z - player.pos.z, curr.getPos().x - player.pos.x);
    float dist = curr.getSize() + player.getSize();
    curr.updateXZ(player.pos.x + cos(angle) * dist, player.pos.z + sin(angle) * dist);
  }
}

boolean enemyCollision(Entity one, Entity two)
{
  PVector posOne = one.getPos();
  PVector posTwo = two.getPos();
  return dist(posOne.x, posOne.z, posTwo.x, posTwo.z) < one.getSize() + two.getSize();
}

Enemy getClosestEnemy(PVector pos, float weaponRange)
{
  float closest = weaponRange;
  Enemy toReturn = null;

  for (int i = 0; i < map.enemys.size(); i++)
  {
    Enemy enemy = map.enemys.get(i);
    float dist = dist(pos.x, pos.z, enemy.getPos().x, enemy.getPos().z);

    if (dist < closest)
    {
      closest = dist;
      toReturn = enemy;
    }
  }

  return toReturn;
}
