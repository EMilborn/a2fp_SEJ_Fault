class Bullet extends Entity {
  boolean shot;
  Ship parent;
  
  Bullet(Ship ship) {
    x = ship.x;
    y = ship.y;
    shape = loadShape("Butterfly.svg");
    shape.scale(.1);
    degree = ship.degree;
    speed = ship.speed*2;
    shot = false;
    parent = ship;
  }
  
  void draw() {
    if (shot) {
      move();
      shape.rotate(radians(degree));
      shape(shape, x, y);
      shape.rotate(radians(-degree));
    }
  }
}