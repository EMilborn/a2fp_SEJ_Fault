class Ship extends Entity {
  Bullet[] ammo;
  boolean keys[];
  char[] keyLetters;
  
  boolean shield;
  int numBullets;
  int MAX_BULLETS = 3;
  
  Ship(){
    size = 50;
    x = width/2;
    y = height/2;
    shape = loadShape("Butterfly.svg");
    shape.scale(.3);
    degree = 50;
    speed = 5;

    ammo = new Bullet[MAX_BULLETS];
    for (int i = 0; i < ammo.length; i++) {
      ammo[i] = new Bullet(this);
    }
    keys = new boolean[] { false, false };
  }
  
  Ship(int x, int y, int degree, String shape){
    this();
    this.x = x;
    this.y = y;
    this.degree = degree;
    this.shape = loadShape(shape);
  }
  
  Ship(char[] keyLetters){
    this();
    this.keyLetters = keyLetters;
  }
  
  void update(){
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
    if (keys[0]){
          //shoot
    }
    if (keys[1]){
          //turn
          degree += 3;
    } 
  }

  boolean collision(Entity other) {
    float dSqrd = ((other.x - x)*(other.x - x)) + ((other.y - y)*(other.y - y));
    if (dSqrd <= (size+other.size) * (size+other.size)) {
      return true;
    }
    return false;
  }
}