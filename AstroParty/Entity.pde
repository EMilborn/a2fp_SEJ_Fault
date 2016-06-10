class Entity {
  //attributes
  int x;
  int y;
  PShape shape;
  float degree;
  int speed;
  int size;

  //Methods
  void move() {
    float addX = cos(radians(degree)) * speed;
    float addY = sin(radians(degree)) * speed;
    if (!(x + addX + size > width || x + addX - size < 0)) {
      x += addX;
    }
    if (!(y + addY + size > height || y + addY - size < 0)) {
      y += addY;
    }
    collision();
  }


  void update() { 
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }

  void collision() {}
}