class Bat extends Enemy
{
  Bat(PVector pos, float speed, float baseSize, int health, int damage, float range, int fireRate, int XP)
  {
    super(pos, speed, baseSize, health, damage, range, fireRate, XP);
  }

  void render()
  {
    super.render();
    push();
    translate(pos);
    translate(0, -100, 0);
    rotateY(rot);
    fill(0);
    box(150, 25, 25);
    pop();
  }
}
