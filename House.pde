class House implements Object
{
  PVector pos;
  float rot;

  House(PVector pos, float rot)
  {
    this.pos = pos;
    this.rot = rot;
  }

  void render()
  {
    push();
    translate(pos);
    rotateY(rot);
    translate(0, -500, 0);
    push();
    fill(100);
    image(wallTexture, 0, 0, 1000, 1000);
    pop();
    translate(0, -600, -400);
    rotateX(HALF_PI - PI/15);
    image(roofTexture, 0, 0, 1000, 1000);
    pop();
  }

  boolean shouldRemove()
  {
    return false;
  }
}
