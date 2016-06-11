class Ship extends Entity {
  Bullet [] ammo;
  boolean [] keys;
  char [] keyLetters;
  
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
    ammo[0] = new Bullet(this);
    ammo[1] = new Bullet(this);
    ammo[2] = new Bullet(this);
    keys = new boolean[2];
    keys[0] = false;
    keys[1] = false;
  }
  
  Ship(int x, int y, int degree, String shape){
    this();
    this.x = x;
    this.y = y;
    this.degree = degree;
    this.shape = loadShape(shape);
  }
  
  Ship(char [] keyLetters){
    this();
    this.keyLetters = new char [2];
    this.keyLetters[0] = keyLetters[0];
    this.keyLetters[1] = keyLetters[1];
  }
  
  void update(){
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
    if (keys[0]==true){
          //shoot
    }
    if (keys[1] == true){
          //turn
          degree += 3;
    } 
  }
}