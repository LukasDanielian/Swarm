void translate(PVector v)
{
  translate(v.x,v.y,v.z);
}

boolean enemyCollision(Enemy one, Enemy two)
{
  PVector posOne = one.getPos();
  PVector posTwo = two.getPos();
  return dist(posOne.x,posOne.z,posTwo.x,posTwo.z) < one.getSize() + two.getSize();
}
