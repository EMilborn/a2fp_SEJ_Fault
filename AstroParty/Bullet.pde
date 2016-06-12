class Bullet extends Entity {
  boolean shot;
  Ship parent;
  
  Bullet(Ship ship) {
    speed = ship.speed*2;
    degree = ship.degree;
    updateNormal();
    x = ship.x + addX * 7;
    y = ship.y + addY * 7;
    System.out.println(y + " " + ship.y);
    System.out.println(x + " " + ship.x);

    shape = loadShape("Butterfly.svg");
    shape.scale(.1);
    shot = false;
    parent = ship;
  }
  
  void draw() {
    if (shot) {
      update();
    }
  }
}