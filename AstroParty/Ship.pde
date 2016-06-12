class Ship extends Entity {
  //------------------------------------------------------------------------------------------------------------------------
  int MAX_BULLETS = 3;
  int BULLET_REGEN_COOLDOWN = 120; // 2 seconds
  int ALIVE = 0;
  int DEAD = 1;
  int PILOT = 2;

  ArrayList<Bullet> bulletsFired;
  boolean keys[];
  char[] keyLetters;
  int cooldown;
  boolean shield;
  int numBullets;
  String col;

  int state;
  
  //------------------------------------------------------------------------------------------------------------------------
  Ship(Ship copy){
    super();
    col = copy.col;
    size = copy.size;
    x = copy.x;
    y = copy.y;
    degree = copy.degree;
    speed = copy.speed;
    numBullets = copy.numBullets;
    bulletsFired = copy.bulletsFired;
    keys = copy.keys;
    cooldown = copy.cooldown;
    state = copy.state;
    updateShape();
  }
  Ship(String newCol) {
    super();
    col = newCol;
    size = 30;
    x = width/2;
    y = height/2;
    degree = 50;
    speed = 5;
    numBullets = MAX_BULLETS;
    bulletsFired = new ArrayList<Bullet>();
    keys = new boolean[] { false, false };
    cooldown = BULLET_REGEN_COOLDOWN;
    state = ALIVE;
    updateShape();
  }

  Ship(int x, int y, int degree, String newCol) {
    this(newCol);
    this.x = x;
    this.y = y;
    this.degree = degree;
  }

  Ship(char[] keyLetters, String newCol) {
    this(newCol);
    this.keyLetters = keyLetters;
  }
  
  void updateShape(){
    shape = loadShape("images/"+col + "_" + numBullets + ".svg");
    shape.scale(3);
  }
  //------------------------------------------------------------------------------------------------------------------------
  void update() {
    super.update();
    updateHelp();
  }
  
  
  void update(Ship other){
    if(collision(other)){
      super.update(other);
      updateHelp();
    } else {
      this.update();
      other.update();
    }
  }
  


  void updateHelp(){
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
  }
  
  void borderCheck(){
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

  boolean collide(Entity[] others) {
    for (Entity other: others) {
      if (!this.equals(other)) {
        if (collision(other)) {
          if (other instanceof Bullet) {
            ((Bullet) other).shot = false;
            state = DEAD; // PILOT for pilot execution?
            return true;
          }
        }
      }
    }
    return false;
  }

  boolean collide(ArrayList<Entity> others) {
    return collide(others.toArray(new Entity[others.size()]));
  }

  Bullet shoot() {
    if (numBullets <= MAX_BULLETS && numBullets > 0) {
      Bullet bullet = new Bullet(this);
      numBullets--;
      updateShape();
      return bullet;
    }
    return null;
  }
}