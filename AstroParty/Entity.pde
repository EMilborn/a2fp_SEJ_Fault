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
    rotate(degree);
    background(51);
    shape(shape, x, y);
    rotate(-degree);
  }

  void collision() {}
}