class Ship extends Entity {
  int ammo;
  Bullet [] ammo;
  boolean [] keys;
  String [] keyLetters;
  
  boolean shield;
  int numBullets;
  
  Ship(){
    size = 50;
    x = width/2;
    y = height/2;
    shape = loadShape("Butterfly.svg");
    shape.scale(.3);
    degree = 50;
    speed = 5;
    numBullets = 3;
    ammo = new Bullet[3];
    Bullet[0] = new Bullet(this);
    Bullet[1] = new Bullet(this);
    Bullet[2] = new Bullet(this);
    keys = new boolean[2];
    keys[0] = false;
    keys[1] = false;
  }
  
  Ship(int x, int y, int degree, String shape{
    this();
    this.x = x;
    this.y = y;
    this.degree = degree;
    this.shape = loadShape(shape);
  }
    
}