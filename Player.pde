class Player extends Entity
{
  int XP, level, abilityDamage;
  int[] levelXP = new int[20];
  int[] upgradeTracker = {0, 0, 0, 0, 0};
  int[] damageLevels = {10, 25, 100, 250, 1000};
  int[] speedLevels = {10, 12, 15, 20, 25};
  int[] healthLevels = {200, 300, 400, 500, 700};
  int[] fireRateLevels = {60, 45, 30, 10, 2};
  int[] abilityLevels = {50, 100, 200, 300, 500};

  Player()
  {
    super(new PVector(0, 0, 0), 300);
    damage = damageLevels[upgradeTracker[0]];
    speed = speedLevels[upgradeTracker[1]];
    health = fullHealth = healthLevels[upgradeTracker[2]];
    fireRate = fireRateLevels[upgradeTracker[3]];
    abilityDamage = abilityLevels[upgradeTracker[4]];

    for (int i = 0; i < 20; i++)
      levelXP[i] = int(100 * pow(2, i));
  }

  void render()
  {
    renderModel();
    renderHUD();
    attack();

    if (frameCount % 60 ==0)
      addHealth(3);
  }

  void updateCam()
  {
    perspective(PI/2.5, float(width)/height, .01, width * 3);
    camera(pos.x, pos.y - 2000, pos.z + 1000, pos.x, pos.y, pos.z, 0, 1, 0);
  }

  void renderModel()
  {
    push();
    translate(pos);
    translate(0, -baseSize, 0);
    rotateX(QUARTER_PI);
    noFill();
    stroke(0);
    strokeWeight(3);
    rect(0, 0, baseSize, 30);
    rectMode(CORNER);
    noStroke();
    fill(0, 255, 0);
    rect(-baseSize/2, -15, map(health, 0, fullHealth, 0, baseSize), 30);
    rectMode(CENTER);

    translate(-baseSize/2, 0, 0);
    fill(0);

    for (float x = baseSize/(fullHealth/100); x < baseSize; x += baseSize/(fullHealth/100))
      rect(x, 0, 5, 30);

    pop();

    Enemy enemy = getClosestEnemy(pos, 1700);

    if (enemy != null)
      rot = -atan2(enemy.pos.z - pos.z, enemy.pos.x - pos.x) + HALF_PI;

    push();
    translate(pos);
    rotateY(rot);
    box(50, 50, 50);
    pop();
  }

  void renderBase()
  {
    translate(pos.x, -pos.z);
    rotate(rot);
    noFill();
    stroke(0);
    strokeWeight(5);
    circle(0, 0, baseSize);
    translate(0, -150);
    triangle(-100, 0, 100, 0, 0, -100);
  }

  void updateKeys()
  {
    if (keyPressed)
    {
      if (keyDown('W'))
        pos.z -= speed;
      if (keyDown('S'))
        pos.z += speed;
      if (keyDown('A'))
        pos.x -= speed;
      if (keyDown('D'))
        pos.x += speed;
    }
  }

  void renderHUD()
  {
    push();
    camera();
    ortho();
    hint(DISABLE_DEPTH_TEST);
    fill(0);

    noFill();
    stroke(0);
    strokeWeight(3);
    rect(width * .5, height * .975, width * .3, height * .05);
    rectMode(CORNER);
    noStroke();
    fill(#360239);
    rect(width * .35, height * .95, map(XP, 0, levelXP[level], 0, width * .3), height * .05);
    rectMode(CENTER);

    fill(255);
    noStroke();
    rect(width * .35 - height * .025, height * .975, height * .05, height * .05);
    textSize((level < 10)? 50 : 30);
    fill(0);
    text((level + 1), width * .35 - height * .025, height * .975);
    hint(ENABLE_DEPTH_TEST);
    pop();
  }

  void attack()
  {
    if (frameCount % fireRate == 0)
    {
      Enemy target = getClosestEnemy(pos, 1700);

      if (target != null)
        map.objects.add(new Projectile(pos.copy(), target.getPos(), damage));
    }
  }

  void addXP(int num)
  {
    if (level < levelXP.length-1)
    {
      XP += num;

      if (XP >= levelXP[level])
      {
        XP -= levelXP[level];
        level++;
        gameState = "Upgrading";
      }
    }
  }

  boolean upgrade(int upgrade)
  {
    if (upgradeTracker[upgrade] < 4)
    {
      upgradeTracker[upgrade]++;

      if (upgrade == 0)
        damage = damageLevels[upgradeTracker[upgrade]];
      else if (upgrade == 1)
        speed = speedLevels[upgradeTracker[upgrade]];
      else if (upgrade == 2)
        fullHealth = healthLevels[upgradeTracker[upgrade]];
      else if (upgrade == 3)
        fireRate = fireRateLevels[upgradeTracker[upgrade]];
      else if (upgrade == 4)
        abilityDamage = abilityLevels[upgradeTracker[upgrade]];
    }

    //cant upgrade
    else
      return false;

    return true;
  }

  void addHealth(int amount)
  {
    health += amount;

    if (health > fullHealth)
      health = fullHealth;
  }
}
