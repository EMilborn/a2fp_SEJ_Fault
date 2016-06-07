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
    
    rotate(degree);
    background(51);
    shape(shape);
    rotate(degree);
  }

  void collision() {}
}