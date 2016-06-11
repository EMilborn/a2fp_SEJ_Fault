class Ship extends Entity {
  Bullet[] ammo;
  boolean[] keys;
  String[] keyLetters;
  int MAX_BULLETS = 3;
  
  boolean shield;
  int numBullets;
  
  Ship() {
    size = 50;
    x = width/2;
    y = height/2;
    shape = loadShape("Butterfly.svg");
    shape.scale(0.3);
    degree = 50;
    speed = 5;
    ammo = new Bullet[MAX_BULLETS];
    for (int i = 0; i < ammo.length; i++) {
      ammo[i] = new Bullet(this);
    }
    keys = new boolean[2];
    keys[0] = false;
    keys[1] = false;
  }

  Ship(int x, int y, int degree, String shape) {
    this();
    this.x = x;
    this.y = y;
    this.degree = degree;
    this.shape = loadShape(shape);
  }
    
}