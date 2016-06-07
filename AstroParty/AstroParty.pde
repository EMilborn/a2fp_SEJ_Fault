
  Ship ship;
  
  void setup(){
    ship = new Ship();
    size(600,600);
  } 
  
  void draw(){
    background(4);
    fill(255);
    ship.move();
    shape(ship.shape, 300, 300, 10, 10);
    //ship.update(); 
  }
  

    