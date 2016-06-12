class Entity {
  //attributes
  float x;
  float y;
  PShape shape;
  float degree;
  int speed;
  int size;
  float addX;
  float addY;

  //Methods
  void move() {
    updateNormal();
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
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }

  void collision() {}
}