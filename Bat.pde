class Bat extends Enemy
{
  Bat(PVector pos)
  {
    super(pos, 150, 10, 3, 15, 60, 10);
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
