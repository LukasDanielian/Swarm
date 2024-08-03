class Player extends Entity
{  
  Player()
  {
    super(new PVector(0,0,0), 10, 300, 100, 10, 1500, 60, true);
  }
  
  void render()
  {
    updateKeys();
    updateBounds();
    updateCam();
    renderModel();
    renderHUD();
    weapon.attack();
  }

  void updateCam()
  {
    perspective(PI/2.5, float(width)/height, .01, width * 3);
    camera(pos.x, pos.y - 2000, pos.z + 1000, pos.x,pos.y,pos.z, 0,1,0);
  }
  
  void renderModel()
  {
    if(weapon.tPos != null)
      rot = -atan2(weapon.tPos.z - pos.z, weapon.tPos.x - pos.x) + HALF_PI;
      
    push();
    translate(pos);
    rotateY(rot);
    box(50,50,50);
    pop();
  }
  
  void renderBase()
  {
    translate(pos.x,-pos.z);
    rotate(rot);
    noFill();
    stroke(0);
    strokeWeight(5);
    circle(0,0,baseSize);
    translate(0,-150);
    triangle(-100,0,100,0,0,-100);
  }
  
  void updateKeys()
  {
    if(keyPressed)
    {
      if(keyDown('W'))
        pos.z -= speed;
      if(keyDown('S'))
        pos.z += speed;
      if(keyDown('A'))
        pos.x -= speed;
      if(keyDown('D'))
        pos.x += speed;
    }
  }
  
  void renderHUD()
  {
    
  }
}
