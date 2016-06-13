class Entity {
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

  Entity() {
    border = 20;
    gameHeight = height;
    gameWidth = 750;
  }

  //------------------------------------------------------------------------------------------------------------------------
  // Deals with the movement of an Entity
  void move() {
    float[] add = updateVectors();
    addX = add[0];
    addY = add[1];
  }

  void move(Entity other) {
    float[] add = updateVectors(other);
    addX = add[0];
    addY = add[1];
    other.addX = addX;
    other.addY = addY;
    //borderCheck();
    //other.borderCheck();
  }

  //------------------------------------------------------------------------------------------------------------------------
  float[] updateVectors() {
    float X = cos(radians(degree)) * speed;
    float Y = sin(radians(degree)) * speed;
    float[] ans = {X, Y};
    return ans;
  }

  float[] updateVectors(Entity other) {
    float X = cos(radians(degree)) * speed;
    float Y = sin(radians(degree)) * speed;
    float[] otherDirection = other.updateVectors();
    X = X + otherDirection[0]; //adding vectors
    Y = Y + otherDirection[1]; //adding vectors
    float[] ans = {X, Y};
    return ans;
  }

  //------------------------------------------------------------------------------------------------------------------------
  void moveCheckX() {
      x += addX;
  }
  void moveCheckY() {
      y += addY;
  }

  //------------------------------------------------------------------------------------------------------------------------
  boolean collision(Entity other) {
    if (other == null) {
      return false;
    }
    float dSqrd = ((other.x - x)*(other.x - x)) + ((other.y - y)*(other.y - y));
    if (dSqrd <= (size+other.size) * (size+other.size)) {
      return true;
    }
    return false;
  }

  boolean collide(Entity[] others) {
    for (Entity other: others) {
      if (!this.equals(other)) {
        if (collision(other)) {
          return true;
        }
      }
    }
    return false;
  }

  boolean collide(ArrayList<Entity> others) {
    return collide(others.toArray(new Entity[others.size()]));
  }
  //------------------------------------------------------------------------------------------------------------------------

  // Prints out the Entity
  void update() {
    shape.rotate(radians(degree));
    shape(shape, x, y);
    shape.rotate(radians(-degree));
  }

  void collision() {}
}