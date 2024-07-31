interface Object
{
  void render();
  boolean shouldRemove();
}

interface Enemy
{
  void render();
  void checkCollision();
  void renderBase();
  void attack();
  void applyDamage(int damage);
  boolean shouldRemove();
  PVector getPos();
  float getSize();
}
