void keyPressed()
{
  if (keyCode >= 0 && keyCode <= 256)
    keys[keyCode] = true;
}

void keyReleased()
{
  if (keyCode >= 0 && keyCode <= 256)
    keys[keyCode] = false;
}

boolean keyDown(int key)
{
  return keys[key];
}
