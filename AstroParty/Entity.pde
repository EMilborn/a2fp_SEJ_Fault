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
    x += cos(radians(degree)) * speed;
    y += sin(radians(degree)) * speed;
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