class Ship extends Entity {
  //------------------------------------------------------------------------------------------------------------------------
  int MAX_BULLETS = 3;
  int BULLET_REGEN_COOLDOWN = 120; // 2 seconds
  int SHIP_RESPAWN_TIME = 300; // 5 seconds
  int ALIVE = 0;
  int DEAD = 1;
  int PILOT = 2;

  ArrayList<Bullet> bulletsFired;
  boolean keys[];
  char[] keyLetters;
  int cooldown;
  int respawn;
  boolean shield;
  int numBullets;
  String col;

  int state;

  //------------------------------------------------------------------------------------------------------------------------

  Ship(String col) {
    super();
    this.col = col;
    size = 15;
    x = width/2;
    y = height/2;
    degree = 50;
    speed = 4;

    bulletsFired = new ArrayList<Bullet>();
    keys = new boolean[] { false, false };

    numBullets = MAX_BULLETS;
    cooldown = BULLET_REGEN_COOLDOWN;
    respawn = SHIP_RESPAWN_TIME;
    state = ALIVE;

    updateShape();
  }

  Ship(int x, int y, int degree, String col) {
    this(col);
    this.x = x;
    this.y = y;
    this.degree = degree;
  }

  Ship(char[] keyLetters, String col) {
    this(col);
    this.keyLetters = keyLetters;
  }

  void updateShape() {
    if (shield) {
      shape = loadShape("images/"+col + "_" + numBullets + "_shield.svg");
    } else {
      shape = loadShape("images/"+col + "_" + numBullets + ".svg");
    }
    shape.scale(3);
  }
  //------------------------------------------------------------------------------------------------------------------------
  void update() {
    super.update();
    updateHelp();
  }

  /*
  void update(Ship other){
    if(collision(other)){
      super.update(other);
      updateHelp();
    } else {
      this.update();
      other.update();
    }
  }*/

  void updateHelp() {
    if (keys[1]) {
      //turn
      degree += 3;
    }

    for (Bullet bullet : bulletsFired) {
      bullet.update();
    }

    cooldown--;
    if (cooldown <= 0) {
      cooldown = BULLET_REGEN_COOLDOWN;
      if (numBullets <= 2) {
        numBullets++;
        updateShape();
      }
    }
    if (state == PILOT) {
      respawn--;
      if (respawn <= 0) {
        numBullets = 3;
        shape = loadShape("images/"+col + "_" + numBullets + ".svg");
        shape.scale(3);
        state = ALIVE;
        respawn = SHIP_RESPAWN_TIME;
        speed = 4;
      }
    }
  }

  void borderCheck() {
      if (!(x + addX + size > gameWidth - border || x + addX - size < border)) 
        x += addX;
      if (!(y + addY + size > gameHeight - border || y + addY - size < border)) 
        y += addY;
  }

  boolean collision(Entity other) {
    if (other == null) {
      return false;
    }
    float dSqrd = ((other.x - x)*(other.x - x)) + ((other.y - y)*(other.y - y));
    if (dSqrd <= (size+other.size) * (size+other.size)) {
      return true;
    }
    return false;
  }

  boolean collideBullet(ArrayList<Entity> others) {
    for (int i = 0; i < others.size(); i++) {
      Bullet bullet = (Bullet) others.get(i);
      if (!this.equals(bullet)) {
        if (collision(bullet)) {
          others.set(i, null);
          return true;
        }
      }
    }
    return false;
  }

  Bullet shoot() {
    if (numBullets <= MAX_BULLETS && numBullets > 0 && state == ALIVE) {
      Bullet bullet = new Bullet(this);
      numBullets--;
      updateShape();
      return bullet;
    }
    return null;
  }

  void setXY(int x, int y) {
    this.x = x;
    this.y = y;
  }

}