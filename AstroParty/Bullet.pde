class Bullet extends Entity{
  boolean shot;
  Ship parent;
  
  Bullet(Ship ship){
    x = ship.x;
    y = ship.y;
    shape = loadShape("Butterfly.svg");
    shape.scale(.1);
    degree = ship.degree;
    speed = ship.speed*2;
    shot = false;
    parent = ship;
  }
  
}