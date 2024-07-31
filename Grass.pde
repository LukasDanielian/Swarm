class Grass implements Object
{
  PVector pos;
  
  Grass(float w, float d)
  {
    pos = new PVector(random(-w/2,w/2),0,random(-d/2,d/2));
  }
  
  void render()
  {
    push();
    translate(pos);
    fill(#032703);
    triangle(-10,0,10,0,0,-30);
    pop();
  }
  
  boolean shouldRemove()
  {
    return false;
  }
}
