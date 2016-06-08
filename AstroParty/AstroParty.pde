
  Ship ship;
  
  PShape rectangle;
  void setup() {
    ship = new Ship();
    size(1000,1000);
  }

  void draw() {
    background(51);
    ship.update();
    if (keyPressed==true){
      ship.degree += 3;
    }
  }

  

    