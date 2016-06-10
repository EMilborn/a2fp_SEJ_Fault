class Ship extends Entity {
  int ammo;
  boolean shield;
  Ship(){
    size = 50;
    x = width/2;
    y = height/2;
    shape = loadShape("Butterfly.svg");
    shape.scale(.3);
    degree = 50;
    speed = 5;
  }
}