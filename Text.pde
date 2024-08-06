class Text implements Object
{
  PVector pos;
  String text;
  float size, dir, rot;
  
  Text(PVector pos, int text)
  {
    this.pos = pos;
    this.text = text + "";
    size = map(int(text),10,1000,50,200);
    dir = (random(0,1) > .5) ? -1 : 1;
  }
  
  void render()
  {
    push();
    translate(pos);
    rotateX(QUARTER_PI);
    rotateZ(dir * rot);
    fill(255);
    textSize(size);
    text(text,0,0);
    pop();
    
    size *= .97;
    pos.y -= 5;
    rot += .01;
  }
  
  boolean shouldRemove()
  {
    return size < 10;
  }
}
