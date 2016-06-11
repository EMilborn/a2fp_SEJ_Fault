class Ship extends Entity {
  ArrayList<Bullet> bulletsFired;
  boolean keys[];
  char[] keyLetters;
  int cooldown;

  boolean shield;
  int numBullets;
  int MAX_BULLETS = 3;
  int BULLET_REGEN_COOLDOWN = 120; // 2 seconds
  
  Ship() {
    size = 50;
    x = width/2;
    y = height/2;
    shape = loadShape("triangle.svg");
    shape.scale(.3);
    degree = 50;
    speed = 5;
    numBullets = MAX_BULLETS;
    bulletsFired = new ArrayList<Bullet>();
    keys = new boolean[] { false, false };
    cooldown = BULLET_REGEN_COOLDOWN;
  }
  
  Ship(int x, int y, int degree, String shape) {
    this();
    this.x = x;
    this.y = y;
    this.degree = degree;
    this.shape = loadShape(shape);
  }
  
  Ship(char[] keyLetters) {
    this();
    this.keyLetters = keyLetters;
  }
  
  void update() {
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
    
    if (keys[1]) {
      //turn
      degree += 3;
    }
    
    for (Bullet bullet : bulletsFired) {
      bullet.draw();
    }
    cooldown--;
    if (cooldown <= 0) {
      cooldown = BULLET_REGEN_COOLDOWN;
      if (numBullets <= 2) {
        numBullets++;
      }
    }
  }

  boolean collision(Entity other) {
    float dSqrd = ((other.x - x)*(other.x - x)) + ((other.y - y)*(other.y - y));
    if (dSqrd <= (size+other.size) * (size+other.size)) {
      return true;
    }
    return false;
  }
  
  //
  void collide(Entity [] others){
    for(Entity other: others){
      if(!this.equals(other)){
        if(collision(other))
  }
  
  void collide(ArrayList<Entity> others){
    
  }
  
  
  
  Bullet shoot() {
    if (numBullets <= MAX_BULLETS && numBullets > 0) {
      Bullet bullet = new Bullet(this);
      bullet.shot = true;
      numBullets--;
      return bullet; 
    }
    return null;
  }
}