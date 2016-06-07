class Ship extends Entity {
  int x;
  int y;
  int ammo;
  boolean shield;
  Ship(){
    size = 10;
    x = width/2;
    y = height/2;
    shape = createShape(RECT,-50,-25,100,50);
    shape.setStroke(color(255));
    shape.setStrokeWeight(4);
    shape.setFill(color(127));
    degree = 90;
    speed = 10;
}
}