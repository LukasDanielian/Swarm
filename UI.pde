void renderUpgrades()
{
  push();
  camera();
  ortho();
  hint(DISABLE_DEPTH_TEST);
  background(255);
  cursor();
  fill(0);
  textSize(90);
  text("Upgrades!", width * .5, height * .1);


  int counter = 0;
  for (float x = width * .2; x <= width * .8; x += width * .15)
  {
    textSize(25);
    text(upgradeNames[counter], x, height * .4);
    image(upgradeImages[counter], x, height * .5, height * .1, height * .1);
    text((player.upgradeTracker[counter] + 1) + "/5", x, height * .6);

    if (player.upgradeTracker[counter]+1 != 5 && dist(mouseX, mouseY, x, height * .5) < height * .05)
    {
      noFill();
      stroke(0);
      strokeWeight(4);
      rect(x, height * .5, height * .1, height * .1);

      if (mousePressed)
      {
        if (player.upgrade(counter))
          gameState = "Playing";
      }
    }
    counter++;
  }

  hint(ENABLE_DEPTH_TEST);
  pop();
}
