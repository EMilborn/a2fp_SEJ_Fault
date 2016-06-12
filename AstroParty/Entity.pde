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
  int gameWidth;
  int gameHeight;
  int border;

  Entity(){
    border = 20;
    gameHeight = height;
    gameWidth = width*3/4;
  }
  // Deals with the movement of an Entity
  void move() {
    updateVectors();
    if (!(x + addX + size > gameWidth - border || x + addX - size < border)) {
      x += addX;
    }
    if (!(y + addY + size > gameHeight - border || y + addY - size < border)) {
      y += addY;
    }
    collision();
  }

  void updateVectors() {
    addX = cos(radians(degree)) * speed;
    addY = sin(radians(degree)) * speed;
  }

  // Moves and prints out the Entity
  void update() {
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }

  void collision() {}
}