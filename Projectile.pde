class Projectile implements Object
{
  PVector pos, tPos, dir;
  float speed, size;
  Enemy target;

  Projectile(PVector pos, PVector tPos, float speed, float size, Enemy target)
  {
    this.pos = pos;
    this.tPos = tPos;
    this.speed = speed;
    this.size = size;
    this.target = target;
  }
  
  void render()
  {
    push();
    translate(pos);
    noStroke();
    fill(#00FF9F);
    sphere(size);
    pop();
    
    float angle = atan2(tPos.z - pos.z, tPos.x - pos.x);
    dir = new PVector(0,-1).rotate(-angle);
    pos.x += dir.x * speed;
    pos.z += dir.y * speed;
  }
  
  boolean shouldRemove()
  {
     return dist(pos.x,pos.y,pos.z,tPos.x,tPos.y,tPos.z) < ((target != null) ? target.getSize() : player.getSize());
  }
}
