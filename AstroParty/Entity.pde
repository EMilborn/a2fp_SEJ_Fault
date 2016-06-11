class Entity {
  //attributes
  int x;
  int y;
  PShape shape;
  float degree;
  int speed;
  int size;
  float addX;
  float addY;

  //Methods
  void move() {
    if (!(x + addX + size > width || x + addX - size < 0)) {
      x += addX;
    }
    if (!(y + addY + size > height || y + addY - size < 0)) {
      y += addY;
    }
    collision();
  }

  void updateNormal(){
    addX = cos(radians(degree)) * speed;
    addY = sin(radians(degree)) * speed;
  }

  void update() { 
    updateNormal();
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }

  void collision() {}
}