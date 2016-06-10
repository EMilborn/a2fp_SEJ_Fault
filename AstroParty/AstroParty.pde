
  Ship ship;
  
  PShape rectangle;
  void setup() {
    size(1000,1000);
    ship = new Ship();
  }

  void draw() {
    background(51);
    ship.update();
    if (keyPressed==true){
      ship.degree += 3;
    }
  }

  

    