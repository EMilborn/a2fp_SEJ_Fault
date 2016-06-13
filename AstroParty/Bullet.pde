class Bullet extends Entity {
  boolean shot;
  Ship parent;

  Bullet(Ship ship) {
    super();
    size = 2;
    border = 25;
    speed = 10;
    degree = ship.degree;
    float[] vectors = updateVectors();
    // Bullet will spawn slightly in front of the ship
    x = ship.x + vectors[0]*5;
    y = ship.y + vectors[1]*5;

    shape = loadShape("images/bullet.svg");
    shape.scale(2);
    parent = ship;
  }
}