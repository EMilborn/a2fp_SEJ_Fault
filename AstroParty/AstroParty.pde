
  Ship ship;
  
  PShape rectangle;
  void setup() {
    ship = new Ship();
    size(640,360,P2D);
  }

  void draw() {
    ship.update();
}
  

    