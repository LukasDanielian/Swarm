class Player
{
  PVector pos;
  float speed, baseSize;
  float rot;
  
  Player()
  {
    pos = new PVector(0,0,0);
    baseSize = 300;
    speed = 10;
  }
  
  void render()
  {
    updateKeys();
    updateBounds();
    updateCam();
    renderModel();
    renderHUD();
  }
  
  void updateCam()
  {
    perspective(PI/2.5, float(width)/height, .01, width * 3);
    camera(pos.x, pos.y - 1500, pos.z + 1300, pos.x,pos.y,pos.z, 0,1,0);
  }
  
  void renderModel()
  {
    rot = -atan2(mouseY - height/2,mouseX - width/2) + HALF_PI;
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
  
  void updateBounds()
  {
    if(pos.x > map.w/2)
      pos.x = map.w/2;
    else if(pos.x < -map.w/2)
      pos.x = -map.w/2;
    if(pos.z > map.d/2)
      pos.z = map.d/2;
    else if(pos.z < -map.d/2)
      pos.z = -map.d/2;
  }
  
  void renderHUD()
  {
    
  }
  
  float getSize()
  {
    return baseSize/2;
  }
}
