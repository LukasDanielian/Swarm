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

  float dist = player.getSize() + curr.getSize();

  if (dist(cPos.x, cPos.z, player.pos.x, player.pos.z) < dist)
  {
    float angle = atan2(curr.getPos().z - player.pos.z, curr.getPos().x - player.pos.x);
    curr.updateXZ(player.pos.x + cos(angle) * dist, player.pos.z + sin(angle) * dist);
  }
}

boolean enemyCollision(Enemy one, Enemy two)
{
  PVector posOne = one.getPos();
  PVector posTwo = two.getPos();
  return dist(posOne.x, posOne.z, posTwo.x, posTwo.z) < one.getSize() + two.getSize();
}

void updateBounds(PVector pos)
{
  if (pos.x > map.w/2)
    pos.x = map.w/2;
  else if (pos.x < -map.w/2)
    pos.x = -map.w/2;
  if (pos.z > map.d/2)
    pos.z = map.d/2;
  else if (pos.z < -map.d/2)
    pos.z = -map.d/2;
}

Enemy getClosestEnemy(PVector pos)
{
  float closest = map.w;
  Enemy toReturn = null;
  
  for(int i = 0; i < map.enemys.size(); i++)
  {
    Enemy enemy = map.enemys.get(i);
    float dist = dist(pos.x,pos.z,enemy.getPos().x,enemy.getPos().z);
    
    if(dist < closest)
    {
      dist = closest;
      toReturn = enemy;
    }
  }
  
  return toReturn;
}
