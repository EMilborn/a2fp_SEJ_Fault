
  Ship ship;
  
  PShape rectangle;
  void setup() {
   ship = new Ship();
  size(640,360,P2D);
}
  
  /*
  void draw(){
    background(51);
    
    ship.move();
    shape(ship.shape, 300, 300, 10, 10);
    //ship.update(); 
  }*/
  
  void draw() {
    ship.move();
  background(51);
  translate(mouseX, mouseY);
  ship.shape.setFill(color(map(mouseX, 0, width, 0, 255)));
  shape(ship.shape);
}
  

    