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
  
  //------------------------------------------------------------------------------------------------------------------------
  // Deals with the movement of an Entity
  void move() {
    float [] add = updateVectors();
    addX = add[0];
    addY = add[1];
    if (!(x + addX + size > gameWidth - border || x + addX - size < border)) {
      x += addX;
    }
    if (!(y + addY + size > gameHeight - border || y + addY - size < border)) {
      y += addY;
    }
  }
  
  void move(Entity other) {
    float [] add = updateVectors(other);
    addX = add[0];
    addY = add[1];
    other.addX = addX;
    other.addY = addY;
    borderCheck();
    other.borderCheck();
  }

  //------------------------------------------------------------------------------------------------------------------------
  float [] updateVectors() {
    float X = cos(radians(degree)) * speed;
    float Y = sin(radians(degree)) * speed;
    float [] ans = {X, Y};
    return ans;
  }
  
  float [] updateVectors(Entity other) {
    float X = cos(radians(degree)) * speed;
    float Y = sin(radians(degree)) * speed;
    float [] otherDirection = other.updateVectors();
    X = X + otherDirection[0]; //adding vectors
    Y = Y + otherDirection[1]; //adding vectors
    float [] ans = {X, Y};
    return ans;
  }
  
  //------------------------------------------------------------------------------------------------------------------------
  void borderCheck(){
    if (!(x + addX + size > gameWidth - border || x + addX - size < border)) {
      x += addX;
    }
    if (!(y + addY + size > gameHeight - border || y + addY - size < border)) {
      y += addY;
    }
  }
  
  
  //------------------------------------------------------------------------------------------------------------------------
  // Moves and prints out the Entity
  void update() {
    move();
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }
  
  void update(Entity other){
    move(other);
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }

  void collision() {}
}