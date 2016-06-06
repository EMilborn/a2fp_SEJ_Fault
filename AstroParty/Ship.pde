class Ship extends Entity {
  int x;
  int y;
  int ammo;
  boolean shield;
  Ship(){
    size = 10;
    x = width/2;
    y = height/2;
    shape = createShape(RECT, x, y, size, size);
    degree = 90;
    speed = 10;
}
}