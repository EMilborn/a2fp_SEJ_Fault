
  Ship ship;
  
  void setup(){
    ship = new Ship();
    size(600,600);
  } 
  void draw(){
    fill(204);
    ship.move();
    ship.print();
  }

    