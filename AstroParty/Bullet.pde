class Bullet extends Entity {
  boolean shot;
  Ship parent;

  Bullet(Ship ship) {
    super();
    border = 25;
    speed = ship.speed*2;
    degree = ship.degree;
    updateVectors();
    // Bullet will spawn slightly in front of the ship
    x = ship.x + addX * 7;
    y = ship.y + addY * 7;

    shape = loadShape("Butterfly.svg");
    shape.scale(.1);
    shot = false;
    parent = ship;
  }
}