
  Ship ship;
  
  PShape rectangle;
  void setup() {
    ship = new Ship();
    size(1000,1000,P2D);
  }

  void draw() {
    ship.update();
    if (keyPressed==true){
      ship.degree += 1;
  }

  

    